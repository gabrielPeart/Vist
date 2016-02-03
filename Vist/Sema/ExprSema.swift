//
//  ExprSema.swift
//  Vist
//
//  Created by Josef Willsher on 03/02/2016.
//  Copyright © 2016 vistlang. All rights reserved.
//


//-------------------------------------------------------------------------------------------------------------------------
//  MARK:                                                 Literals
//-------------------------------------------------------------------------------------------------------------------------

extension IntegerLiteral : ExprTypeProvider {
    
    func llvmType(scope: SemaScope) throws -> Ty {
        guard let ty = scope[type: "Int"] else { throw error(SemaError.NoStdIntType, userVisible: false) }
        self.type = ty
        return ty
    }
}

extension FloatingPointLiteral : ExprTypeProvider {
    
    func llvmType(scope: SemaScope) throws -> Ty {
        let ty = BuiltinType.Float(size: size) // TODO: Float stdlib
        self.type = ty
        return ty
    }
}

extension BooleanLiteral : ExprTypeProvider {
    
    func llvmType(scope: SemaScope) throws -> Ty {
        guard let ty = scope[type: "Bool"] else { throw error(SemaError.NoStdBoolType, userVisible: false) }
        self.type = ty
        return ty
    }
}

extension StringLiteral : ExprTypeProvider {
    
    func llvmType(scope: SemaScope) throws -> Ty {
        let t = BuiltinType.Array(el: BuiltinType.Int(size: 8), size: UInt32(count))
        self.type = t
        return t
    }
}

extension NullExpr : ExprTypeProvider {
    
    mutating func llvmType(scope: SemaScope) throws -> Ty {
        _type = nil
        return BuiltinType.Null
    }
}

//-------------------------------------------------------------------------------------------------------------------------
//  MARK:                                                 Variables
//-------------------------------------------------------------------------------------------------------------------------

extension Variable : ExprTypeProvider {
    
    func llvmType(scope: SemaScope) throws -> Ty {
        
        // lookup variable type in scope
        guard let v = scope[variable: name] else {
            throw error(SemaError.NoVariable(name))
        }
        
        // assign type to self and return
        self._type = v
        return v
    }
}


extension MutationExpr : ExprTypeProvider {
    
    func llvmType(scope: SemaScope) throws -> Ty {
        
        // gen types for variable and value
        let old = try object.llvmType(scope)
        let new = try value.llvmType(scope)
        
        guard old == new else { throw error(SemaError.DifferentTypeForMutation(object.desc, old, new)) }
        
        return BuiltinType.Null
    }
}


extension VariableDecl : DeclTypeProvider {
    
    func llvmType(scope: SemaScope) throws {
        // handle redeclaration
        if let _ = scope[variable: name] {
            throw error(SemaError.InvalidRedeclaration(name, value))
        }
        
        // get any explicit type
        let explicitType = BuiltinType(aType ?? "") as? Ty ?? scope[type: aType ?? ""]
        
        // scope for declaration -- not a return type and sets the `semaContext` to the explicitType
        let declScope = SemaScope(parent: scope, returnType: nil, semaContext: explicitType)
        
        let objectType = try value.llvmType(declScope)
        
        if case let fn as FnType = objectType {
            scope[function: name] = fn          // store in function table if closure
        }
        else {
            scope[variable: name] = objectType  // store in arr
        }
        
        // if its a null expression
        if let e = explicitType where value._type == BuiltinType.Null && value is NullExpr {
            value._type = e
        } // otherwise, if the type is null, we are assigning to something we shouldn't be
        else if objectType == BuiltinType.Null {
            throw error(SemaError.CannotAssignToNullExpression(name))
        }
        
    }
}



//-------------------------------------------------------------------------------------------------------------------------
//  MARK:                                                 Exprs
//-------------------------------------------------------------------------------------------------------------------------

extension BinaryExpr : ExprTypeProvider {
    
    func llvmType(scope: SemaScope) throws -> Ty {
        
        let args = [lhs, rhs]
        
        guard let params = try args.stableOptionalMap({ try $0.llvmType(scope) }) else { fatalError("params not typed") }
        let fnType: FnType
        
        if let (mangledName, stdLibType) = StdLibFunctions.getStdLibFunction(op, args: params) where !scope.isStdLib {
            self.mangledName = mangledName
            fnType = stdLibType
            
        }
        else {
            guard let ty = scope[function: op, paramTypes: params]  else {
                if let f = scope[function: op] { throw error(SemaError.WrongFunctionApplications(name: op, applied: params, expected: f.params)) }
                else                           { throw error(SemaError.NoFunction(op, params)) }
            }
            
            self.mangledName = op.mangle(ty)
            fnType = ty
        }
        
        // gen types for objects in call
        for arg in args {
            try arg.llvmType(scope)
        }
        
        // assign type to self and return
        self.fnType = fnType
        self._type = fnType.returns
        return fnType.returns
    }
}


extension Void : ExprTypeProvider {
    
    func llvmType(scope: SemaScope) throws -> Ty {
        self.type = BuiltinType.Void
        return BuiltinType.Void
    }
}




//-------------------------------------------------------------------------------------------------------------------------
//  MARK:                                                 Functions
//-------------------------------------------------------------------------------------------------------------------------


extension ClosureExpr : ExprTypeProvider {
    
    func llvmType(scope: SemaScope) throws -> Ty {
        
        // no type inferrence from param list, just from AST context
        let ty = (scope.semaContext as? FnType) ?? FnType(params: [BuiltinType.Void], returns: BuiltinType.Void)
        self.type = ty
        
        // we dont want implicit captutring
        let innerScope = SemaScope.nonCapturingScope(scope, returnType: ty)
        innerScope.returnType = ty.returns
        
        for (i, t) in ty.params.enumerate() {
            let name = parameters.isEmpty ? i.implicitArgName() : parameters[i]
            innerScope[variable: name] = t
        }
        
        // TODO: Implementation relying on parameters
        // Specify which parameters from the scope are copied into the closure
        //  - this is needed for method calls -- as `self` needs to be copied in
        // Make syntax for the users to define this
        
        for exp in exprs {
            try exp.llvmType(innerScope)
        }
        
        return ty
    }
}



//-------------------------------------------------------------------------------------------------------------------------
//  MARK:                                                 Arrays
//-------------------------------------------------------------------------------------------------------------------------

extension ArrayExpr : ExprTypeProvider {
    
    func llvmType(scope: SemaScope) throws -> Ty {
        
        // element types
        var types: [Ty] = []
        for el in arr {
            types.append(try el.llvmType(scope))
        }
        
        // make sure array is homogeneous
        guard Set(types.map { $0.ir() }).count == 1 else { throw error(SemaError.HeterogenousArray(types)) }
        
        // get element type and assign to self
        guard let elementType = types.first else { throw error(SemaError.EmptyArray) }
        self.elType = elementType
        
        // assign array type to self and return
        let t = BuiltinType.Array(el: elementType, size: UInt32(arr.count))
        self.type = t
        return t
    }
    
}

extension ArraySubscriptExpr : ExprTypeProvider {
    
    func llvmType(scope: SemaScope) throws -> Ty {
        
        // make sure its an array
        guard case let v as Variable = arr, case BuiltinType.Array(let type, _)? = scope[variable: v.name] else { throw error(SemaError.CannotSubscriptNonArrayVariable) }
        
        // gen type for subscripting value
        guard case BuiltinType.Int = try index.llvmType(scope) else { throw error(SemaError.NonIntegerSubscript) }
        
        // assign type to self and return
        self._type = type
        return type
    }
    
}

