    //
//  TypeAlias.swift
//  Vist
//
//  Created by Josef Willsher on 29/02/2016.
//  Copyright © 2016 vistlang. All rights reserved.
//


/// A defined abstract type. These sit in a type table in VIR and LLVM
/// and allow the types to be named.
///
/// `TypeAlias` simply wraps `targetType` and
final class TypeAlias : Type {
    let name: String, targetType: StorageType
    
    init(name: String, targetType: StorageType) {
        self.name = name
        self.targetType = targetType
    }
}

extension TypeAlias : StorageType {
    var members: [StructMember] { return targetType.members }
    var methods: [StructMethod] { return targetType.methods }
    var irName: String { return targetType.irName }
    var heapAllocated: Bool { return targetType.heapAllocated }
}

extension TypeAlias {
    
    func lowerType(module: Module) -> LLVMType {
        
        if module.loweredModule == nil {
            // backup if a module isnt lowered
            return targetType.lowerType(module)
        }
        
        // when lowering the alias, we need to get the ref in the LLVM module...
        let found = try? getNamedType(targetType.irName, module.loweredModule!.getModule())
        if let found = found where found != nil {
            return LLVMType(ref: found)
        }
        
        // ...and if it isnt already defined we lower the target and add it
        let type = targetType.lowerType(module)
        let namedType = createNamedType(type.type, targetType.irName)
        
        return LLVMType(ref: namedType)
    }
    
    func usingTypesIn(module: Module) -> Type {
        return self
    }
    var mangledName: String {
        return targetType.mangledName
    }
}

// we need a hash for the type so it can sit in the the type table set
extension TypeAlias: Hashable {
    
    var hashValue: Int {
        return name.hashValue
    }
}

extension TypeAlias: Equatable { }

@warn_unused_result
func == (lhs: TypeAlias, rhs: TypeAlias) -> Bool {
    return lhs.targetType == rhs.targetType
}
