//
//  FunctionContainer.swift
//  Vist
//
//  Created by Josef Willsher on 27/01/2016.
//  Copyright © 2016 vistlang. All rights reserved.
//

/// Holds functions, mangles them on initialisation and subscript
///
/// Used to tell the compiler about functions
///
struct FunctionContainer {
    
    private let functions: [String: FunctionType]
    private let types: [StructType]
    private let concepts: [ConceptType]
    
    /**
     Initialiser takes a collection of tuples.
     
     Tuples are of the unmangled name and the type object
     
     Optionally takes an array of metadata to apply to all functions
     */
    init (functions: [(String, FunctionType)], types: [StructType], concepts: [ConceptType] = [], metadata: [String] = [], mangleFunctionNames: Bool = true) {
        var functionTypes: [String: FunctionType] = [:]
        
        for (n, _ty) in functions {
            var ty = _ty
            let mangled = mangleFunctionNames ? n.mangle(ty.params) : n
            ty.metadata += metadata
            functionTypes[mangled] = ty
        }
        
        let typesWithMethods = types.map { t -> StructType in
            var type = t
            type.methods = type.methods.map { m in (m.name,  m.type.withParent(t, mutating: m.mutating), m.mutating) }
            for m in type.methods { // add methods to function table
                var type = m.type
                if let y = type.yieldType {
                    type.setGeneratorVariantType(yielding: y)
                }
                functionTypes[m.name.mangle(m.type)] = type
            }
            return type
        }
        
        self.functions = functionTypes
        self.types = typesWithMethods
        self.concepts = concepts
    }
    
    /// Get a named function
    /// - parameter id: Unmangled name
    /// - parameter types: Applied arg types
    /// - returns: An optional tuple of `(mangledName, type)`
    subscript(fn fn: String, types types: [Type]) -> (mangledName: String, type: FunctionType)? {
        get {
            let mangled = fn.mangle(types)
            guard let ty = functions[mangled] else { return nil }
            return (mangled, ty)
        }
    }
    /// unmangled
    subscript(mangledName mangledName: String) -> (mangledName: String, type: FunctionType)? {
        get {
            return functions[mangledName].map { (mangledName, $0) }
        }
    }
    
    
    /// Returns type from type name
    subscript(type type: String) -> StructType? {
        get {
            return types
                .indexOf { $0.name == type }
                .map { types[$0] }
        }
    }
    
}
