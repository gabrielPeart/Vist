//
//  FunctionInst.swift
//  Vist
//
//  Created by Josef Willsher on 02/03/2016.
//  Copyright © 2016 vistlang. All rights reserved.
//


/// Any VIR function call Inst
/// - seealso: `FunctionCallInst`
/// - seealso: `FunctionApplicationInst`
protocol VIRFunctionCall : Inst, VIRLower {
    var functionRef: LLVMFunction { get }
    var functionType: FunctionType { get }
}

/**
 A function call
 
 `%a = call @HalfOpenRange_tII (%0:%Int, %1:%Int)`
 */
final class FunctionCallInst: Inst, VIRFunctionCall {
    var function: Function
    var returnType: Type
    
    var type: Type? { return returnType }
    
    var uses: [Operand] = []
    var args: [Operand]
    
    private init(function: Function, returnType: Type, args: [Operand], irName: String?) {
        self.function = function
        self.returnType = returnType
        self.args = args
        initialiseArgs()
        self.irName = irName
    }
    
    var vir: String {
        return "\(name) = call @\(function.name) \(args.virValueTuple())\(useComment)"
    }
    var instHasSideEffects: Bool { return true }
    
    var functionRef: LLVMFunction { return function.loweredFunction! }
    var functionType: FunctionType { return function.type }
    
    func copy() -> FunctionCallInst {
        return FunctionCallInst(function: function, returnType: returnType, args: args.map { $0.formCopy() }, irName: irName)
    }
    var parentBlock: BasicBlock?
    var irName: String?
}

/**
 A function application. Call a function ref variable
 
 `%a = apply %0 (%1:%Int, %2:%Int)`
 */
final class FunctionApplyInst: Inst, VIRFunctionCall {
    var function: PtrOperand
    var returnType: Type
    
    var type: Type? { return returnType }
    
    var uses: [Operand] = []
    var args: [Operand]
    
    private init(function: PtrOperand, returnType: Type, args: [Operand], irName: String?) {
        self.function = function
        self.returnType = returnType
        self.args = args
        initialiseArgs()
        self.irName = irName
    }
    
    var vir: String {
        return "\(name) = apply \(function.valueName) \(args.virValueTuple())\(useComment)"
    }
    var instHasSideEffects: Bool { return true }
    
    var functionRef: LLVMFunction { return LLVMFunction(ref: function.loweredValue!._value) }
    var functionType: FunctionType { return function.memType as! FunctionType }
    
    func copy() -> FunctionApplyInst {
        return FunctionApplyInst(function: function, returnType: returnType, args: args.map { $0.formCopy() }, irName: irName)
    }
    
    var parentBlock: BasicBlock?
    var irName: String?
}


extension Builder {
    
    /// Calls a VIR function with given args
    @discardableResult
    func buildFunctionCall(function: Function, args: [Operand], irName: String? = nil) throws -> FunctionCallInst {
        return try _add(instruction: FunctionCallInst(function: function, returnType: function.type.returns, args: args, irName: irName))
    }
    @discardableResult
    /// Applies the args to a function ref
    func buildFunctionApply(function: PtrOperand, returnType: Type, args: [Operand], irName: String? = nil) throws -> FunctionApplyInst {
        return try _add(instruction: FunctionApplyInst(function: function, returnType: returnType, args: args, irName: irName))
    }
}
