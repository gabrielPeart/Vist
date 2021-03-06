//
//  FunctionSema.swift
//  Vist
//
//  Created by Josef Willsher on 03/02/2016.
//  Copyright © 2016 vistlang. All rights reserved.
//

extension FuncDecl : DeclTypeProvider {
    
    /// Generate the function type and mangled name for a function. This also
    /// sets `self`'s properties
    /// - note: call `typeForNode(_:)` to sema the body 
    func genFunctionInterface(scope: SemaScope, addToScope: Bool) throws -> FunctionType {
        
        let declScope = SemaScope(parent: scope)
        declScope.genericParameters = genericParameters
        
        let mutableSelf = attrs.contains(.mutating)
        let paramTypes = try typeRepr.params(scope: declScope), returnType = try typeRepr.returnType(scope: declScope)
        // if its a generator function there is no return
        let ret = isGeneratorFunction ? BuiltinType.void : returnType
        
        var ty: FunctionType
        
        if let parentType = parent?.declaredType {
            ty = FunctionType(params: paramTypes, returns: ret, callingConvention: .method(selfType: parentType, mutating: mutableSelf))
        }
        else {
            ty = FunctionType(params: paramTypes, returns: ret)
        }
        
        if isGeneratorFunction {
            ty.setGeneratorVariantType(yielding: returnType)
        }
        
        typeRepr.type = ty
        // mangle non runtime exposed names
        let mangled = attrs.contains(.runtime) ? name : name.mangle(type: ty)
        self.mangledName = mangled
        if addToScope {
            scope.addFunction(mangledName: mangled, type: ty)
        }
        return ty
    }
    
    func typeCheckNode(scope: SemaScope) throws {
        
        // if we have already gen'ed the interface for this function, fnType.type
        // won't be nil, if we haven't, gen it now
        let ty = try typeRepr.type ?? genFunctionInterface(scope: scope, addToScope: true)
        
        guard let impl = self.impl else { return }
        // if body construct scope and parse inside it
        
        let mutableSelf = attrs.contains(.mutating)
        
        // get the type the scope returns or yields
        let scopeRetType: Type
        if let yt = ty.yieldType, isGeneratorFunction {
            scopeRetType = yt
        }
        else {
            scopeRetType = ty.returns
        }
        
        // scope return type hint applies to yield and return so use `returnType`
        let scopeName = (scope.name ?? "") + "." + (self.mangledName ?? self.name)
        let fnScope = SemaScope.capturing(scope, overrideReturnType: scopeRetType, isYield: isGeneratorFunction, scopeName: scopeName)
        
        // make surebound list is same length
        guard impl.params.count == ty.params.count || isGeneratorFunction else {
            throw semaError(.wrongFuncParamList(applied: impl.params, forType: ty.params))
        }
        
        for (type, name) in zip(ty.params, impl.params) {
            fnScope.addVariable(variable: (type: type, mutable: false, isImmutableCapture: false), name: name)
        }
        
        // if is a method
        if let parentType = parent?.declaredType {
            // add self
            fnScope.addVariable(variable: (type: parentType, mutable: mutableSelf, isImmutableCapture: !mutableSelf), name: "self")
            // add self's memebrs implicitly
            for (memberName, memberType, mutable) in parentType.members {
                fnScope.addVariable(variable: (type: memberType, mutable: mutable && mutableSelf, isImmutableCapture: !mutableSelf), name: memberName)
            }
        }
        
        // type gen for inner scope
        try impl.body.exprs.walkChildren { exp in
            try exp.typeCheckNode(scope: fnScope)
        }
        
        if isGeneratorFunction {
            // so there are equal number of param names and params in the type
            // for the VIRGen phase
            impl.params.append("loop_thunk")
        }
        
    }
    
}

extension BinaryExpr : ExprTypeProvider {
    
    func typeCheckNode(scope: SemaScope) throws -> Type {
        return try semaFunctionCall(scope: scope).type.returns
    }
}


extension FunctionCallExpr : ExprTypeProvider {
    
    func typeCheckNode(scope: SemaScope) throws -> Type {
        let fnType = try semaFunctionCall(scope: scope).type
        
        // if this fn is an implicit method call on 'self', we form then type check
        // that subtree, and save it as a member of self. VIRGen must then check
        // to see if this exists, and emit VIR for it
        if case .method = fnType.callingConvention {
            // TODO: would this be better if we could rewrite 'self'?
            let selfObject = SelfExpr()
            _ = try selfObject.typeCheckNode(scope: scope)
            // create a call to the type checked self object
            let call = MethodCallExpr(name: name, args: args, object: selfObject)
            let fnType = try call.semaFunctionCall(scope: scope)
            self.implicitMethodExpr = call
            return fnType.type.returns
        }
        
        return fnType.returns
    }
}

extension FunctionCall {
    
    /// Perform sema for any function call.
    ///
    /// Sets self.fnType to the function type, self._type to the return
    /// type, self.mangledName to the mangled name, and returns the function type
    ///
    /// Also does sema on the args and body.
    func semaFunctionCall(scope: SemaScope) throws -> (mangledName: String, type: FunctionType) {
        
        // gen types for objects in call
        for (i, arg) in argArr.enumerated() {
            let name = (scope.name ?? "") + self.name + "@" + String(i)
            let argScope = SemaScope.capturing(scope, scopeName: name)
            argScope.semaContext = nil
            try arg.typeCheckNode(scope: argScope)
        }
        
        // get from table
        guard let argTypes = argArr.optionalMap({ expr in expr._type }) else {
            throw semaError(.paramsNotTyped, userVisible: false)
        }
        
        let (mangledName, fnType) = try scope.function(named: name, argTypes: argTypes, base: base)
        self.mangledName = mangledName
        self.fnType = fnType
        
        for (i, (arg, argType)) in zip(argArr, fnType.params).enumerated()
            where arg is ClosureExpr {
            // rewrite the closure arg types
            let name = (scope.name ?? "") + self.name + "@" + String(i)
            let argScope = SemaScope.capturing(scope, context: argType, scopeName: name)
            try arg.typeCheckNode(scope: argScope)
        }
        
        // assign type to self and return
        self._type = fnType.returns
        return (mangledName, fnType)
    }
}


extension MethodCallExpr : ExprTypeProvider {
    
    func typeCheckNode(scope: SemaScope) throws -> Type {
        
        let ty = try object.typeCheckNode(scope: scope)
        guard case let parentType as NominalType = ty else {
            throw semaError(.notStructType(ty), userVisible: false)
        }
        self.structType = parentType
        
        // get the function type and sema the args
        let fnType = try semaFunctionCall(scope: scope).type
        
        guard case .method(_, let mutatingMethod) = fnType.callingConvention else { throw semaError(.functionNotMethod, userVisible: false) }
        let (baseType, _, allowsMutation) = try object.recursiveType(scope: scope)
        
        if mutatingMethod && !allowsMutation {
            throw semaError(.mutatingMethodOnImmutable(method: name, baseType: baseType.explicitName))
        }
        
        // assign type to self and return
        return fnType.returns
    }
}

