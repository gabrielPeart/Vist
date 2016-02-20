//
//  StorageType.swift
//  Vist
//
//  Created by Josef Willsher on 16/02/2016.
//  Copyright © 2016 vistlang. All rights reserved.
//

typealias StructMember = (name: String, type: Ty, mutable: Bool)
typealias StructMethod = (name: String, type: FnType)


/// A type which can have elements looked up by name,
/// for example structs and existential protocols
///
protocol StorageType: Ty {
    /// User visible type name
    var name: String { get }
    
    var members: [StructMember] { get }
    var methods: [StructMethod] { get }
    
    /// LLVM type representing self.
    /// A struct of `{member-types...}`
    func memberTypes(module: LLVMModuleRef) -> LLVMTypeRef
    
    /// Name this type is given at the global scope of IR
    var irName: String { get }
}

extension StorageType {
    
    func indexOfMemberNamed(name: String) throws -> Int {
        guard let i = members.indexOf({ $0.name == name }) else { throw semaError(.noPropertyNamed(type: self.name, property: name)) }
        return i
    }
    
    func globalType(module: LLVMModuleRef) -> LLVMTypeRef {
        
        // if no module is defined, we can only return the raw type
        if module == nil { return memberTypes(module) }
        
        let found = getNamedType(irName, module)
        if found != nil { return found }
        
        let type = memberTypes(module)
        let namedType = createNamedType(type, irName)
        
        return namedType
    }
    
    func propertyType(name: String) throws -> Ty {
        return members[try indexOfMemberNamed(name)].type
    }
    
    func propertyMutable(name: String) throws -> Bool {
        return members[try indexOfMemberNamed(name)].mutable
    }
    func getMethod(methodName: String, argTypes types: [Ty]) -> FnType? {
        return methods[raw: methodName, paramTypes: types]
    }
    
    /// Returns whether a type models a concept
    func models(concept: ConceptType) -> Bool {
        // TODO: explicit, opt into methods, this should be a check in sema
        for f in concept.requiredFunctions where !methods.contains({ $0.name.demangleName() == f.name.demangleName() && $0.type == f.type }) { return false }
        for p in concept.requiredProperties where !members.contains({ $0.name == p.name && $0.type == p.type }) { return false }
        return true
    }
}

