//
//  IRGen.swift
//  Vist
//
//  Created by Josef Willsher on 15/11/2015.
//  Copyright © 2015 vistlang. All rights reserved.
//

import Foundation

// global builder and module references
private var builder: LLVMBuilderRef = nil
private var module: LLVMModuleRef = nil


/// A type which can generate LLVM IR code
private protocol IRGenerator {
    func codeGen(stackFrame: StackFrame) throws -> LLVMValueRef
}

private protocol BasicBlockGenerator {
    func bbGen(innerStackFrame stackFrame: StackFrame, fn: LLVMValueRef) throws -> LLVMBasicBlockRef
}



//-------------------------------------------------------------------------------------------------------------------------
//  MARK:                                                 Helpers
//-------------------------------------------------------------------------------------------------------------------------

private func isFloatType(t: LLVMTypeKind) -> Bool {
    return [LLVMFloatTypeKind, LLVMDoubleTypeKind, LLVMHalfTypeKind, LLVMFP128TypeKind].contains(t)
}

extension ASTNode {
    
    private func nodeCodeGen(stackFrame: StackFrame) throws -> LLVMValueRef {
        guard case let gen as IRGenerator = self else { throw error(IRError.NotGenerator(self.dynamicType), userVisible: false) }
        return try gen.codeGen(stackFrame)
    }
    
}


extension CollectionType where
    Generator.Element == COpaquePointer,
    Index == Int,
    Index.Distance == Int {
    
    /// get a ptr to the memory of the collection
    func ptr() -> UnsafeMutablePointer<Generator.Element> {
        
        let p = UnsafeMutablePointer<Generator.Element>.alloc(count)
        
        for i in self.startIndex..<self.endIndex {
            p.advancedBy(i).initialize(self[i])
        }
        
        return p
    }
    
}

extension LLVMBool : Swift.BooleanType, BooleanLiteralConvertible {
    
    public init(booleanLiteral value: Bool) {
        self.init(value ? 1 : 0)
    }
    
    public var boolValue: Bool {
        return self == 1
    }
}

private func codeGenIn(stackFrame: StackFrame) -> Expr throws -> LLVMValueRef {
    return { e in
        try e.nodeCodeGen(stackFrame)
    }
}

private func validateModule(ref: LLVMModuleRef) throws {
    var err = UnsafeMutablePointer<Int8>.alloc(1)
    guard !LLVMVerifyModule(module, LLVMReturnStatusAction, &err) else {
        throw error(IRError.InvalidModule(module, String.fromCString(err)), userVisible: false)
    }
}


private func validateFunction(ref: LLVMValueRef, name: String) throws {
    guard !LLVMVerifyFunction(ref, LLVMReturnStatusAction) else {
        throw error(IRError.InvalidFunction(name), userVisible: false)
    }
}




/**************************************************************************************************************************/
// MARK: -                                                 IR GEN


//-------------------------------------------------------------------------------------------------------------------------
//  MARK:                                                 Literals
//-------------------------------------------------------------------------------------------------------------------------

extension IntegerLiteral : IRGenerator {
    
    private func codeGen(stackFrame: StackFrame) throws -> LLVMValueRef {
        let rawType = BuiltinType.Int(size: size)
        let value = LLVMConstInt(rawType.ir(), UInt64(val), false)
        
        guard let type = self.type else { throw error(SemaError.IntegerNotTyped, userVisible: false) }
        return type.initialiseWithBuiltin(value, module: module, builder: builder)
    }
}


extension FloatingPointLiteral : IRGenerator {
    
    private func codeGen(stackFrame: StackFrame) -> LLVMValueRef {
        return LLVMConstReal(type!.ir(), val)
    }
}


extension BooleanLiteral : IRGenerator {
    
    private func codeGen(stackFrame: StackFrame) throws -> LLVMValueRef {
        let rawType = BuiltinType.Bool
        let value = LLVMConstInt(rawType.ir(), UInt64(val.hashValue), false)
        
        guard let type = self.type else { throw error(SemaError.BoolNotTyped, userVisible: false) }
        return type.initialiseWithBuiltin(value, module: module, builder: builder)
    }
}


extension StringLiteral : IRGenerator {
    
    private func codeGen(stackFrame: StackFrame) -> LLVMValueRef {
        
        var s: COpaquePointer = nil
        str
            .cStringUsingEncoding(NSUTF8StringEncoding)?
            .withUnsafeBufferPointer { ptr in
            s = LLVMConstString(ptr.baseAddress, UInt32(ptr.count), true)
        }
        
        return s
    }
}

//-------------------------------------------------------------------------------------------------------------------------
//  MARK:                                                 Variables
//-------------------------------------------------------------------------------------------------------------------------

extension VariableExpr : IRGenerator {
    
    private func codeGen(stackFrame: StackFrame) throws -> LLVMValueRef {
        let variable = try stackFrame.variable(name ?? "")
        
        return try variable.load(name ?? "")
    }
}


extension VariableDecl : IRGenerator {
    
    private func codeGen(stackFrame: StackFrame) throws -> LLVMValueRef {
        
        if case let arr as ArrayExpr = value {
            //if asigning to array
            
            let a = try arr.arrInstance(stackFrame)
            a.allocHead(builder, name: name, mutable: isMutable)
            stackFrame.addVariable(a, named: name)
            
            return a.ptr
        }
        else if case let ty as FnType = value._type {
            // handle assigning a closure
            
            // Function being made
            let fn = LLVMAddFunction(module, name, ty.ir())
            
            // make and move into entry block
            let entryBlock = LLVMAppendBasicBlock(fn, "entry")
            LLVMPositionBuilderAtEnd(builder, entryBlock)
            
            // stack frame of fn
            let fnStackFrame = StackFrame(block: entryBlock, function: fn, parentStackFrame: stackFrame)
            
            // value’s IR, this needs to be called and returned
            let v = try value.nodeCodeGen(fnStackFrame)
            
            let num = LLVMCountParams(fn)
            for i in 0..<num {
                let param = LLVMGetParam(fn, i)
                let name = i.implicitArgName()
                LLVMSetValueName(param, name)
            }
            
            // args of `fn`
            let args = (0..<num)
                .map { LLVMGetParam(fn, $0) }
                .ptr()
            defer { args.dealloc(Int(num)) }
            
            // call function pointer `v`
            let call = LLVMBuildCall(builder, v, args, num, "")
            
            // return this value from `fn`
            LLVMBuildRet(builder, call)
            
            // move into bb from before
            LLVMPositionBuilderAtEnd(builder, stackFrame.block)
            
            return fn
        }
        else {
            // all other types
            
            // create value
            let v = try value.nodeCodeGen(stackFrame)
            
            // checks
            guard v != nil else { throw error(IRError.CannotAssignToType(value.dynamicType), userVisible: false) }
            let type = LLVMTypeOf(v)
            guard type != LLVMVoidType() else { throw error(IRError.CannotAssignToVoid, userVisible: false) }
            
            // create variable
            let variable: MutableVariable
            if case let t as StructType = value._type {
                let properties = t.members.map {
                    ($0.0, $0.1.ir(), $0.2)
                }
                variable = MutableStructVariable.alloc(builder, type: type, name: t.name, mutable: isMutable, properties: properties)
            }
            else if case let t as TupleType = value._type {
                let properties = t.members.enumerate().map {
                    (String($0.0), $0.1.ir(), false)
                }
                variable = MutableStructVariable.alloc(builder, type: type, name: "tuple", mutable: isMutable, properties: properties)
            }
            else {
                variable = ReferenceVariable.alloc(builder, type: type, name: name ?? "", mutable: isMutable)
            }
            // Load in memory
            try variable.store(v)
            
            // update stack frame variables
            stackFrame.addVariable(variable, named: name)
            
            return v
        }
    }
}


extension MutationExpr : IRGenerator {
    
    private func codeGen(stackFrame: StackFrame) throws -> LLVMValueRef {
        
        switch object {
        case let object as VariableExpr:
            // object = newValue
            
            let variable = try stackFrame.variable(object.name)
            
            if case let arrayVariable as ArrayVariable = variable, case let arrayExpression as ArrayExpr = value {
                
                let newArray = try arrayExpression.arrInstance(stackFrame)
                arrayVariable.assignFrom(newArray, builder: builder)
            }
            else {
                let new = try value.nodeCodeGen(stackFrame)
                
                guard case let v as MutableVariable = variable where v.mutable else { throw error(IRError.NotMutable(object.name), userVisible: false) }
                try v.store(new)
            }
        case let sub as ArraySubscriptExpr:
            
            let arr = try sub.backingArrayVariable(stackFrame)
            
            let i = try sub.index.nodeCodeGen(stackFrame)
            let val = try value.nodeCodeGen(stackFrame)
            
            arr.store(val, inElementAtIndex: i)

        case let prop as PropertyLookupExpr:
            // foo.bar = meme
            
            guard case let n as VariableExpr = prop.object else { throw error(IRError.CannotLookupPropertyFromNonVariable, userVisible: false) }
            
            guard case let variable as MutableStructVariable = try stackFrame.variable(n.name) else {
                if try stackFrame.variable(n.name) is ParameterStructVariable { throw error(IRError.CannotMutateParam) }
                throw error(IRError.NoProperty(type: prop._type.description, property: n.name))
            }
            
            guard variable.mutable else { throw error(IRError.NotMutable(prop.name)) }
            guard try variable.propertyIsMutable(prop.name) else { throw error(IRError.NotMutableProp(name: prop.name, inType: variable.name)) }
            
            let val = try value.nodeCodeGen(stackFrame)
            
            try variable.store(val, inPropertyNamed: prop.name)
            
        default:
            throw error(IRError.Unreachable, userVisible: false)
        }
        
        return nil
    }
    
}



//-------------------------------------------------------------------------------------------------------------------------
//  MARK:                                                 Exprs
//-------------------------------------------------------------------------------------------------------------------------

extension BinaryExpr : IRGenerator {
    
    private func codeGen(stackFrame: StackFrame) throws -> LLVMValueRef {
        
        let lIR = try lhs.nodeCodeGen(stackFrame), rIR = try rhs.nodeCodeGen(stackFrame)
        guard let argTypes = [lhs, rhs].stableOptionalMap({ $0._type }), fnType = self.fnType else { throw error(SemaError.ParamsNotTyped, userVisible: false) }
        
        let fn: LLVMValueRef
        
        if let (type, fnIR) = StdLib.getFunctionIR(op, args: argTypes, module: module) {
            fn = fnIR
        }
        else {
            fn = LLVMGetNamedFunction(module, mangledName)
        }
        
        // arguments
        let argBuffer = [lIR, rIR].ptr()
        defer { argBuffer.dealloc(2) }
        
        guard fn != nil && LLVMCountParams(fn) == UInt32(2) else { throw error(IRError.WrongFunctionApplication(op), userVisible: false) }
        
        let doNotUseName = _type == BuiltinType.Void || _type == BuiltinType.Null || _type == nil
        let n = doNotUseName ? "" : "\(op).res"
        
        // add call to IR
        let call = LLVMBuildCall(builder, fn, argBuffer, UInt32(2), n)
        fnType.addMetadata(call)
        return call
    }
}


extension Void : IRGenerator {
    private func codeGen(stackFrame: StackFrame) throws -> LLVMValueRef {
        return nil
    }
}


//-------------------------------------------------------------------------------------------------------------------------
//  MARK:                                                 Functions
//-------------------------------------------------------------------------------------------------------------------------

extension FunctionCallExpr : IRGenerator {
    
    private func codeGen(stackFrame: StackFrame) throws -> LLVMValueRef {
        
        let argCount = self.args.elements.count
        let args = try self.args.elements.map(codeGenIn(stackFrame))
        guard let argTypes = self.args.elements.stableOptionalMap({ $0._type }) else { throw error(SemaError.ParamsNotTyped, userVisible: false) }

        // Lookup
        if let function = builtinBinaryInstruction(name, builder: builder, module: module) {
            guard args.count == 2 else { throw error(IRError.WrongFunctionApplication(name), userVisible: false) }
            return try function(args[0], args[1])
        }
        else if let function = builtinInstruction(name, builder: builder, module: module) {
            guard args.count == 0 else { throw error(IRError.WrongFunctionApplication(name), userVisible: false) }
            return function()
        }
        
        let fn: LLVMValueRef
        
        // if its in the stdlib return it
        if let (type, f) = StdLib.getFunctionIR(name, args: argTypes, module: module) {
            fn = f
            self.fnType = type
        }
        else {
            // make function
            fn = LLVMGetNamedFunction(module, mangledName)
        }
        
//        let ty = try stackFrame.functionType(mangledName)
        guard let fnType = self.fnType else { throw error(IRError.NotTyped, userVisible: false) }
        
        // arguments
        let argBuffer = args.ptr()
        defer { argBuffer.dealloc(argCount) }
        
        guard fn != nil && LLVMCountParams(fn) == UInt32(argCount) else { throw error(IRError.WrongFunctionApplication(name), userVisible: false) }
        
        let doNotUseName = _type == BuiltinType.Void || _type == BuiltinType.Null || _type == nil
        let n = doNotUseName ? "" : "\(name)_res"
        
        // add call to IR
        let call = LLVMBuildCall(builder, fn, argBuffer, UInt32(argCount), n)
        fnType.addMetadata(call)
        return call
    }
    
}


private extension FunctionType {
    
    private func params() throws -> [LLVMTypeRef] {
        guard let res = type else { throw error(IRError.TypeNotFound, userVisible: false) }
        return try res.nonVoid.map(ir)
    }
}


extension FuncDecl : IRGenerator {
    // function definition
    
    private func codeGen(stackFrame: StackFrame) throws -> LLVMValueRef {
        
        let type: FnType
        let startIndex: Int // where do the user's params start being used, 0 for free funcs and 1 for methods
        let parentType: StructType? // the type of self is its a method
        
        let args = fnType.args.arr(), argCount = args.count
        
        if let parent = self.parent {
            guard let _parentType = parent.type else { throw error(IRError.NoParentType, userVisible: false) }
            guard let _type = fnType.type else { throw error(IRError.TypeNotFound, userVisible: false) }
            
            type = FnType(params: [_parentType] + _type.params, returns: _type.returns)
            startIndex = 1
            parentType = _parentType
        }
        else {
            let args = fnType.args, argCount = args.count
            guard let t = fnType.type else { throw error(IRError.TypeNotFound, userVisible: false) }
            
            type = t
            startIndex = 0
            parentType = nil
        }
        
        // If existing function definition
        let _fn = LLVMGetNamedFunction(module, mangledName)
        if _fn != nil && LLVMCountParams(_fn) == UInt32(argCount + startIndex) && LLVMCountBasicBlocks(_fn) != 0 && LLVMGetEntryBasicBlock(_fn) != nil {
            return _fn
        }
        
        // Set params
        let argBuffer = try fnType.params().ptr()
        defer { argBuffer.dealloc(argCount) }
        
        // make function
        let functionType = type.ir()
        let function = LLVMAddFunction(module, mangledName, functionType)
        LLVMSetFunctionCallConv(function, LLVMCCallConv.rawValue)
        
        if stackFrame.isStdLib {
            LLVMSetLinkage(function, LLVMExternalLinkage)
        }
        else { // set internal. Will set external or private if has the attribute
            LLVMSetLinkage(function, LLVMInternalLinkage)
        }
        
        // add attrs
        for a in attrs {
            a.addAttrTo(function)
        }
        
        // setup function block
        let entryBlock = LLVMAppendBasicBlock(function, "entry")
        LLVMPositionBuilderAtEnd(builder, entryBlock) // TODO: If isStdLib
        
        // Add function type to stack frame
        stackFrame.addFunctionType(functionType, named: mangledName)
        
        // stack frame internal to function, needs params setting and then the block should be added *inside* the bbGen function
        let functionStackFrame = StackFrame(block: entryBlock, function: function, parentStackFrame: stackFrame)
            
        // set function param names and update table
        for i in 0..<argCount {
            let param = LLVMGetParam(function, UInt32(i + startIndex))
            let name = impl?.params[i] ?? i.implicitArgName()
            LLVMSetValueName(param, name)
            
            let ty = LLVMTypeOf(param)
            if LLVMGetTypeKind(ty) == LLVMStructTypeKind {
                
                let tyName = args[i]
                let t = try stackFrame.type(tyName)
                
                let memTys = t.members.map { ($0.0, $0.1.ir(), $0.2) }
                
                let s = ParameterStructVariable(type: ty, val: param, builder: builder, name: tyName, properties: memTys)
                functionStackFrame.addVariable(s, named: name)
            }
            else {
                let s = StackVariable(val: param, builder: builder)
                functionStackFrame.addVariable(s, named: name)
            }
        }
        
        // if is a method
        if let parentType = parentType {
            // get self from arg list
            let param = LLVMGetParam(function, 0)
            LLVMSetValueName(param, "self")
            // self's members
            let memTys = parentType.members.map { ($0.0, $0.1.ir(), $0.2) }
            
            let s = ParameterStructVariable(type: parentType.ir(), val: param, builder: builder, name: parentType.name, properties: memTys)
            functionStackFrame.addVariable(s, named: "self")
            
            // add self's properties implicitly
            for el in parent?.properties ?? [] {
                let p = StructPropertyVariable(name: el.name, str: s, mutable: el.isMutable)
                functionStackFrame.addVariable(p, named: el.name)
            }
        }
        
        // generate bb for body
        do {
            try impl?.body.bbGen(innerStackFrame: functionStackFrame, ret: type.returns.ir())
        }
        catch {
            LLVMDeleteFunction(function)
            throw error
        }
        
        try validateFunction(function, name: name)
        
        return function
    }
}


extension ReturnStmt : IRGenerator {
    
    private func codeGen(stackFrame: StackFrame) throws -> LLVMValueRef {
        
        if expr._type?.ir() == LLVMVoidType() {
            return LLVMBuildRetVoid(builder)
        }
        
        let v = try expr.nodeCodeGen(stackFrame)
        return LLVMBuildRet(builder, v)
    }
    
}


extension BlockExpr {
    
    private func bbGen(innerStackFrame stackFrame: StackFrame, ret: LLVMValueRef) throws {
        
        // code gen for function
        for exp in exprs {
            try exp.nodeCodeGen(stackFrame)
        }
        
        if exprs.isEmpty || (ret != nil && ret == LLVMVoidType()) {
            LLVMBuildRetVoid(builder)
        }
        
        // reset builder head to parent’s stack frame
        LLVMPositionBuilderAtEnd(builder, stackFrame.parentStackFrame!.block)
    }
    
}


extension ClosureExpr : IRGenerator {
    
    private func codeGen(stackFrame: StackFrame) throws -> LLVMValueRef {
        
        guard let type = self.type else { throw error(IRError.NotTyped, userVisible: false) }
        
        let argBuffer = try type.params.map(ir).ptr()
        defer { argBuffer.dealloc(type.params.count) }
        
        let name = "closure"//.mangle()
        
        let functionType = type.ir()
        let function = LLVMAddFunction(module, name, functionType)
        
        // setup function block
        let entryBlock = LLVMAppendBasicBlock(function, "entry")
        LLVMPositionBuilderAtEnd(builder, entryBlock)
        
        stackFrame.addFunctionType(functionType, named: name)
        
        let functionStackFrame = StackFrame(function: function, parentStackFrame: stackFrame)
        
        // set function param names and update table
        for i in 0..<type.params.count {
            let param = LLVMGetParam(function, UInt32(i))
            let name = parameters.isEmpty ? i.implicitArgName() : parameters[i]
            LLVMSetValueName(param, name)
            
            // FIXME: It looks like i'm lazy -- fix this when doing closures again 
            
//            let ty = LLVMTypeOf(param)
//            if LLVMGetTypeKind(ty) == LLVMStructTypeKind {
//                let ptr = LLVMBuildAlloca(builder, ty, "ptr\(name)")
//                LLVMBuildStore(builder, param, ptr)
//                
//                let tyName = type.params[i].name
//                let t = try stackFrame.type(tyName)
//                
//                let memTys = try t.members.map { ($0.0, try $0.1.ir(), $0.2) }
//                
//                let s = MutableStructVariable(type: ty, ptr: ptr, mutable: false, builder: builder, properties: memTys)
//                functionStackFrame.addVariable(name, val: s)
//            }
//            else {
                let s = StackVariable(val: param, builder: builder)
                functionStackFrame.addVariable(s, named: name)
//            }
        }
        
        do {
            try BlockExpr(exprs: exprs).bbGen(innerStackFrame: functionStackFrame, ret: type.returns.ir())
        } catch {
            LLVMDeleteFunction(function)
            throw error
        }
        
        return function
    }
}


//-------------------------------------------------------------------------------------------------------------------------
//  MARK:                                              Control flow
//-------------------------------------------------------------------------------------------------------------------------

extension ElseIfBlockStmt {
    
    private func ifBBID(n n: Int) -> String {
        return condition == nil ? "else.\(n)" : "then.\(n)"
    }
}

extension ConditionalStmt : IRGenerator {
    
    private func codeGen(stackFrame: StackFrame) throws -> LLVMValueRef {
        
        // block leading into and out of current if block
        var ifIn: LLVMBasicBlockRef = stackFrame.block
        var ifOut: LLVMBasicBlockRef = nil
        
        let leaveIf = LLVMAppendBasicBlock(stackFrame.function, "cont.stmt")
        var rets = true // whether all blocks return
        
        for (i, statement) in statements.enumerate() {
            
            LLVMPositionBuilderAtEnd(builder, ifIn)
            
            /// States whether the block being appended returns from the current scope
            let returnsFromScope = statement.block.exprs.contains { $0 is ReturnStmt }
            rets = rets && returnsFromScope
            
            // condition
            let cond = try statement.condition?.nodeCodeGen(stackFrame)
            if i < statements.count-1 {
                ifOut = LLVMAppendBasicBlock(stackFrame.function, "cont.\(i)")
            }
            else { //else or final else-if statement
                if rets { // If the block returns from the current scope, remove the cont block
                    LLVMRemoveBasicBlockFromParent(leaveIf)
                }
                ifOut = leaveIf
            }
            
            // block and associated stack frame - the then / else block
            let tStackFrame = StackFrame(function: stackFrame.function, parentStackFrame: stackFrame)
            let block = try statement.bbGen(innerStackFrame: tStackFrame, contBlock: leaveIf, name: statement.ifBBID(n: i))
            
            // move builder to in scope
            LLVMPositionBuilderAtEnd(builder, ifIn)
            
            if let cond = cond { //if statement, make conditonal jump
                let v = try cond.load("value", type: statement.condition?._type, builder: builder)
                LLVMBuildCondBr(builder, v, block, ifOut)
            }
            else { // else statement, uncondtional jump
                LLVMBuildBr(builder, block)
                break
            }
            
            ifIn = ifOut
        }
        
        LLVMPositionBuilderAtEnd(builder, leaveIf)
        stackFrame.block = ifOut
        
        return nil
    }
}


private extension ElseIfBlockStmt {
    
    /// Create the basic block for the if Expr
    private func bbGen(innerStackFrame stackFrame: StackFrame, contBlock: LLVMBasicBlockRef, name: String) throws -> LLVMBasicBlockRef {
        
        // add block
        let basicBlock = LLVMAppendBasicBlock(stackFrame.function, name)
        LLVMPositionBuilderAtEnd(builder, basicBlock)
        
        // parse code
        try block.bbGenInline(stackFrame: stackFrame)
        
        // if the block does continues to the contBlock, move the builder there
        let returnsFromScope = block.exprs.contains { $0 is ReturnStmt }
        if !returnsFromScope {
            LLVMBuildBr(builder, contBlock)
            LLVMPositionBuilderAtEnd(builder, contBlock)
        }
        
        return basicBlock
    }
}



//-------------------------------------------------------------------------------------------------------------------------
//  MARK:                                                 Loops
//-------------------------------------------------------------------------------------------------------------------------


extension ForInLoopStmt : IRGenerator {
    
    //    ; ENTRY
    //    br label %loop.header
    //
    // loop.header:                                       ; preds = %loop.latch, %entry
    //    %loop.count.x = phi i64   [ i64 %start.value, %entry ],
    //                              [ %next.x, %loop.latch ]
    //    %x = insertvalue { i64 } undef, i64 %loop.count.x, 0
    //
    // loop.body:                                         ; preds = %loop.header
    //    ; BODY...
    //    br label %loop.latch
    //
    // loop.latch:                                        ; preds = %loop.body
    //    %next.x = add i64 %loop.count.x, 1
    //    %loop.repeat.test = icmp sgt i64 %next.x, i64 %end.value
    //    br i1 %loop.repeat.test, label %loop.exit, label %loop.header
    //
    // loop.exit:                                         ; preds = %loop.body
    //
    //    ; EXIT

    private func codeGen(stackFrame: StackFrame) throws -> LLVMValueRef {
        
        // generate loop and termination blocks
        let loopHeader = LLVMAppendBasicBlock(stackFrame.function, "loop.header")
        let loopBody =   LLVMAppendBasicBlock(stackFrame.function, "loop.body")
        let loopLatch =  LLVMAppendBasicBlock(stackFrame.function, "loop.latch")
        let afterLoop =  LLVMAppendBasicBlock(stackFrame.function, "loop.exit")
        
        let rangeIterator = try iterator.nodeCodeGen(stackFrame)
        
        let startValue = try rangeIterator
            .load("start", type: iterator._type,         builder: builder, irName: "start")
            .load("value", type: stackFrame.type("Int"), builder: builder, irName: "start.value")
        let endValue = try rangeIterator
            .load("end",   type: iterator._type,         builder: builder, irName: "end")
            .load("value", type: stackFrame.type("Int"), builder: builder, irName: "end.value")
        
        // move into loop block
        LLVMBuildBr(builder, loopHeader)
        LLVMPositionBuilderAtEnd(builder, loopHeader)
        
        let stdIntType = try stackFrame.type("Int")
        let intType = BuiltinType.Int(size: 64)
        
        // define variable phi node
        let name = binded.name
        let loopCount = LLVMBuildPhi(builder, intType.ir(), "loop.count.\(name)")
        
        // add incoming value to phi node
        let num1 = [startValue].ptr(), incoming1 = [stackFrame.block].ptr()
        defer { num1.dealloc(1); incoming1.dealloc(1) }
        LLVMAddIncoming(loopCount, num1, incoming1, 1)
        
        // iterate and add phi incoming
        let one = LLVMConstInt(LLVMInt64Type(), UInt64(1), false)
        let next = LLVMBuildAdd(builder, one, loopCount, "next.\(name)")
        
        // gen the IR for the inner block
        let loopCountInt = stdIntType.initialiseWithBuiltin(loopCount, module: module, builder: builder, irName: name)
        let loopVariable = StackVariable(val: loopCountInt, builder: builder)
        let loopStackFrame = StackFrame(block: loopBody, vars: [name: loopVariable], function: stackFrame.function, parentStackFrame: stackFrame)
        
        // Generate loop body
        LLVMBuildBr(builder, loopBody)
        LLVMPositionBuilderAtEnd(builder, loopBody)
        try block.bbGenInline(stackFrame: loopStackFrame)
        
        LLVMBuildBr(builder, loopLatch)
        LLVMPositionBuilderAtEnd(builder, loopLatch)
        
        // conditional break
        let comp = LLVMBuildICmp(builder, LLVMIntSLE, next, endValue, "loop.repeat.test")
        LLVMBuildCondBr(builder, comp, loopHeader, afterLoop)
        
        // move back to loop / end loop
        let num2 = [next].ptr(), incoming2 = [loopLatch].ptr()
        defer { num2.dealloc(1); incoming2.dealloc(1) }
        LLVMAddIncoming(loopCount, num2, incoming2, 1)
        
        LLVMPositionBuilderAtEnd(builder, afterLoop)
        stackFrame.block = afterLoop
        
        return nil
    }
    
}


// TODO: Break statements and passing break-to bb in scope
extension WhileLoopStmt : IRGenerator {
    
    private func codeGen(stackFrame: StackFrame) throws -> LLVMValueRef {
        
        // generate loop and termination blocks
        let loop = LLVMAppendBasicBlock(stackFrame.function, "loop.body")
        let afterLoop = LLVMAppendBasicBlock(stackFrame.function, "loop.exit")
        
        // whether to enter the while, first while check
        let initialCond = try condition.nodeCodeGen(stackFrame)
        let initialCondV = try initialCond.load("value", type: condition._type, builder: builder)

        // move into loop block
        LLVMBuildCondBr(builder, initialCondV, loop, afterLoop)
        LLVMPositionBuilderAtEnd(builder, loop)
        
        // gen the IR for the inner block
        let loopStackFrame = StackFrame(block: loop, function: stackFrame.function, parentStackFrame: stackFrame)
        try block.bbGenInline(stackFrame: loopStackFrame)
        
        // conditional break
        let conditionalRepeat = try condition.nodeCodeGen(stackFrame)
        let conditionalRepeatV = try conditionalRepeat.load("value", type: condition._type, builder: builder)
        LLVMBuildCondBr(builder, conditionalRepeatV, loop, afterLoop)
        
        // move back to loop / end loop
        LLVMPositionBuilderAtEnd(builder, afterLoop)
        stackFrame.block = afterLoop
        
        return nil
    }
    
}


private extension BlockExpr {
    
    /// Generates children’s code directly into the current scope & block
    private func bbGenInline(stackFrame stackFrame: StackFrame) throws {
        
        // code gen for function
        for exp in exprs {
            try exp.nodeCodeGen(stackFrame)
        }
    }
}



//-------------------------------------------------------------------------------------------------------------------------
//  MARK:                                                 Arrays
//-------------------------------------------------------------------------------------------------------------------------

extension ArrayExpr : IRGenerator {
    
    private func arrInstance(stackFrame: StackFrame) throws -> ArrayVariable {
        
        // assume homogeneous
        guard let elementType = elType?.ir() else { throw error(IRError.TypeNotFound, userVisible: false) }
        let arrayType = LLVMArrayType(elementType, UInt32(arr.count))
        
        // allocate memory for arr
        let a = LLVMBuildArrayAlloca(builder, arrayType, nil, "arr")
        
        // obj
        let vars = try arr.map { try $0.nodeCodeGen(stackFrame) }
        let variable = ArrayVariable(ptr: a, elType: elementType, arrType: arrayType, builder: builder, vars: vars)
        
        return variable
    }
    
    private func codeGen(stackFrame: StackFrame) throws -> LLVMValueRef {
        return try arrInstance(stackFrame).load()
    }
    
}


extension ArraySubscriptExpr : IRGenerator {
    
    private func backingArrayVariable(stackFrame: StackFrame) throws -> ArrayVariable {
        
        guard case let v as VariableExpr = arr, case let arr as ArrayVariable = try stackFrame.variable(v.name) else { throw error(IRError.SubscriptingNonVariableTypeNotAllowed) }
        
        return arr
    }
    
    private func codeGen(stackFrame: StackFrame) throws -> LLVMValueRef {

        let arr = try backingArrayVariable(stackFrame)
        let idx = try index.nodeCodeGen(stackFrame)
        
        return arr.loadElementAtIndex(idx)
    }
    
}



//-------------------------------------------------------------------------------------------------------------------------
//  MARK:                                                 Structs
//-------------------------------------------------------------------------------------------------------------------------

extension StructExpr : IRGenerator {
    
    private func codeGen(stackFrame: StackFrame) throws -> LLVMValueRef {
        guard let type = self.type else { throw error(IRError.NotTyped, userVisible: false) }
        
        stackFrame.addType(type, named: name)

        for i in initialisers {
            try i.codeGen(stackFrame)
        }
        
        for m in methods {
            try m.codeGen(stackFrame)
        }

        return nil
    }
    
}


extension InitialiserDecl : IRGenerator {
    
    private func codeGen(stackFrame: StackFrame) throws -> LLVMValueRef {
        
        let args = ty.args.arr(), argCount = args.count
        guard let
            functionType = ty.type?.ir(),
            name = parent?.name,
            parentProperties = parent?.properties,
            parentType = parent?.type
            else {
                throw error(IRError.TypeNotFound, userVisible: false)
        }
        
        // make function
        let function = LLVMAddFunction(module, mangledName, functionType)
        LLVMSetFunctionCallConv(function, LLVMCCallConv.rawValue)
        LLVMAddFunctionAttr(function, LLVMAlwaysInlineAttribute)
        
        guard let impl = self.impl else {
            return function
        }
        
        let entry = LLVMAppendBasicBlock(function, "entry")
        LLVMPositionBuilderAtEnd(builder, entry)

        // Add function type to stack frame
        stackFrame.addFunctionType(functionType, named: name)
        
        // stack frame internal to initialiser, cannot capture from surrounding scope
        let initStackFrame = StackFrame(function: function, parentStackFrame: nil, _isStdLib: stackFrame.isStdLib)
        
        // set function param names and update table
        // TODO: Split this out into a function for funcs & closures to use as well
        for i in 0..<argCount {
            let param = LLVMGetParam(function, UInt32(i))
            let name = impl.params[i]
            LLVMSetValueName(param, name)
            
            let ty = LLVMTypeOf(param)
            if LLVMGetTypeKind(ty) == LLVMStructTypeKind {
                
                // TODO: Fix how this info is brought down
                let tyName = args[i]
                let t = try stackFrame.type(tyName)
                
                let memTys = t.members.map { ($0.0, $0.1.ir(), $0.2) }
                
                let s = ParameterStructVariable(type: ty, val: param, builder: builder, name: tyName, properties: memTys)
                initStackFrame.addVariable(s, named: name)
                
            }
            else {
                let s = StackVariable(val: param, builder: builder)
                initStackFrame.addVariable(s, named: name)
            }
        }
        // 3 ways of passing a struct into a function
        //  - Pass in pointer to copy
        //  - Pass in object and make copy there
        //  - Expand struct to params of function, so a fn taking ({i64 i32} i32) becomes (i64 i32 i32)
        //      - This is harder bacause all property lookups have to be remapped to a param
        
        // get properties to add to the stack frame
        let properties = try parentProperties.map { assignment -> (String, LLVMValueRef, Bool) in
            if let t = assignment.value._type {
                return (assignment.name, t.ir(), assignment.isMutable) }
            else {
                throw error(IRError.NoProperty(type: parentType.name, property: assignment.name))
            }
        }
        
        // allocate struct
        let s = MutableStructVariable.alloc(builder, type: parentType.ir(), name: parentType.name, mutable: true, properties: properties)
        stackFrame.addVariable(s, named: name)
        
        // add struct properties into scope
        for el in parentProperties {
            let p = StructPropertyVariable(name: el.name, str: s, mutable: true) // initialiser can always assign
            initStackFrame.addVariable(p, named: el.name)
        }
        
        // add args into scope
        for exp in impl.body.exprs {
            try exp.nodeCodeGen(initStackFrame)
        }
        
        // return struct instance from init function
        let str = s.load()
        LLVMBuildRet(builder, str)
        
        LLVMPositionBuilderAtEnd(builder, stackFrame.block)
        return function
    }
}

extension PropertyLookupExpr : IRGenerator {
        
    private func codeGen(stackFrame: StackFrame) throws -> LLVMValueRef {
        
        switch object {
        case let n as VariableExpr:
            guard case let variable as StructVariable = try stackFrame.variable(n.name) else { throw error(IRError.NoVariable(n.name)) }
            return try variable.loadPropertyNamed(name)
            
        case let propertyLookup as PropertyLookupExpr:
            let p = try propertyLookup.codeGen(stackFrame)
            return try p.load(name, type: propertyLookup._type, builder: builder, irName: String.fromCString(LLVMGetValueName(p))! + ".\(name)")
            
//        case let tupleLookup as TupleMemberLookupExpr:
//            break
            
        default:
            throw error(IRError.CannotLookupPropertyFromNonVariable)
        }
    }
}


extension MethodCallExpr : IRGenerator {
    
    private func codeGen(stackFrame: StackFrame) throws -> LLVMValueRef {
        
        // get method from module
        let f = LLVMGetNamedFunction(module, mangledName)
        let c = self.params.elements.count + 1
        
        // need to add self to beginning of params
        let params = try ([object as Expr] + self.params.elements)
            .map(codeGenIn(stackFrame))
            .ptr()
        defer { params.dealloc(c) }
        
        let doNotUseName = _type == BuiltinType.Void || _type == BuiltinType.Null || _type == nil
        let n = doNotUseName ? "" : "\(name).res"
        
        
        
        
        
        
        
        
        
        
        
        
        return LLVMBuildCall(builder, f, params, UInt32(c), n)
    }
}




//-------------------------------------------------------------------------------------------------------------------------
//  MARK:                                                 Tuples
//-------------------------------------------------------------------------------------------------------------------------

extension TupleExpr : IRGenerator {
    
    private func codeGen(stackFrame: StackFrame) throws -> LLVMValueRef {
        
        if elements.count == 0 { return nil }
        
        guard let type = self.type else { throw error(IRError.NotTyped, userVisible: false) }
        let typeIR = type.ir()
        
        let memeberIR = try elements.map { try $0.nodeCodeGen(stackFrame) }
        
        let membersWithLLVMTypes = type.members.enumerate().map { (String($0), $1.ir(), false) }
        let s = MutableStructVariable.alloc(builder, type: typeIR, name: "tuple", mutable: false, properties: membersWithLLVMTypes)
        
        for (i, el) in memeberIR.enumerate() {
            try s.store(el, inPropertyNamed: String(i))
        }
        
        return s.load()
    }
}

extension TupleMemberLookupExpr : IRGenerator {
    
    private func codeGen(stackFrame: StackFrame) throws -> LLVMValueRef {
        
        guard case let n as VariableExpr = object else { throw error(IRError.CannotLookupPropertyFromNonVariable, userVisible: false) }
        guard case let variable as StructVariable = try stackFrame.variable(n.name) else { throw error(IRError.NoTupleMemberAt(index))}
        
        let val = try variable.loadPropertyNamed(String(index))
        
        return val
    }
}




//-------------------------------------------------------------------------------------------------------------------------
//  MARK:                                                 AST Gen
//-------------------------------------------------------------------------------------------------------------------------


extension AST {
    
    func IRGen(module m: LLVMModuleRef, isLibrary: Bool, stackFrame s: StackFrame) throws {
        
        // initialise global objects
        builder = LLVMCreateBuilder()
        module = m
        
        // main arguments
        let argBuffer = [LLVMTypeRef]().ptr()
        defer { argBuffer.dealloc(0) }
        
        // make main function & add to IR
        let functionType = LLVMFunctionType(LLVMVoidType(), argBuffer, UInt32(0), false)
        let mainFunction = LLVMAddFunction(module, "main", functionType)
        
        // Setup BB & stack frame
        let programEntryBlock = LLVMAppendBasicBlock(mainFunction, "entry")
        LLVMPositionBuilderAtEnd(builder, programEntryBlock)
        
        let stackFrame = StackFrame(block: programEntryBlock, function: mainFunction, parentStackFrame: s)
        
        let expressions: [ASTNode]
        
        if isLibrary {
             expressions = exprs.filter { $0 is FuncDecl || $0 is StructExpr }
        }
        else {
            expressions = exprs
        }
        
        try expressions.walkChildren { node in
            try node.nodeCodeGen(stackFrame)
        }
        
        // finalise module
        if isLibrary {
            LLVMDeleteFunction(mainFunction)
        }
        else {
            LLVMBuildRetVoid(builder)
        }
        
        // validate whole module
        try validateModule(module)
        
        LLVMDisposeBuilder(builder)
    }
}










