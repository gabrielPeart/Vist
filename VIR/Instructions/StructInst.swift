//
//  StructInst.swift
//  Vist
//
//  Created by Josef Willsher on 02/03/2016.
//  Copyright © 2016 vistlang. All rights reserved.
//


final class StructInitInst : InstBase {
    
    override var type: Type? { return module.getOrInsert(structType) }
    var structType: StructType
    
    private init(type: StructType, args: [Operand], irName: String?) {
        self.structType = type
        super.init(args: args, irName: irName)
    }
    
    override var instVIR: String {
        return "\(name) = struct %\(type!.explicitName) \(args.virValueTuple()) \(useComment)"
    }
}

final class StructExtractInst : InstBase {
    
    var object: Operand, propertyName: String
    var propertyType: Type, structType: StructType
    
    private init(object: Operand, property: String, propertyType: Type, structType: StructType, irName: String? = nil) {
        self.object = object
        self.propertyName = property
        self.propertyType = propertyType
        self.structType = structType
        super.init(args: [object], irName: irName)
    }
    
    override var type: Type? { return propertyType }
    
    override var instVIR: String {
        return "\(name) = struct_extract \(object.vir), !\(propertyName) \(useComment)"
    }
}


final class StructElementPtrInst : InstBase, LValue {
    var object: PtrOperand, propertyName: String
    var propertyType: Type, structType: StructType
    
    private init(object: PtrOperand, property: String, propertyType: Type, structType: StructType, irName: String? = nil) {
        self.object = object
        self.propertyName = property
        self.propertyType = propertyType
        self.structType = structType
        super.init(args: [object], irName: irName)
    }
    
    override var type: Type? { return BuiltinType.pointer(to: propertyType) }
    var memType: Type? { return propertyType }
    
    override var instVIR: String {
        return "\(name) = struct_element \(object.vir), !\(propertyName) \(useComment)"
    }
}


extension Builder {
    func buildStructInit(type: StructType, values: Operand..., irName: String? = nil) throws -> StructInitInst {
        return try _add(StructInitInst(type: type, args: values, irName: irName))
    }
    func buildEmptyStruct(type: StructType, irName: String? = nil) throws -> StructInitInst {
        return try _add(StructInitInst(type: type, args: [], irName: irName))
    }
    
    /// Builds a Struct Extract instruction, which gets an element of a struct by value
    func buildStructExtract(object: Operand, property: String, irName: String? = nil) throws -> StructExtractInst {
        guard case let alias as TypeAlias = object.type, case let structType as StructType = alias.targetType else {
            throw VIRError.noType(#file)
        }
        let elType = try structType.propertyType(property)
        return try _add(StructExtractInst(object: object, property: property, propertyType: elType.usingTypesIn(module), structType: structType, irName: irName))
    }
    
    /// Builds a Struct element ptr instruction, which gets a ptr to the element of a struct
    func buildStructElementPtr(object: PtrOperand, property: String, irName: String? = nil) throws -> StructElementPtrInst {
        guard case let alias as TypeAlias = object.memType, case let structType as StructType = alias.targetType else {
            throw VIRError.noType(#file)
        }
        let elType = try structType.propertyType(property).usingTypesIn(module)
        return try _add(StructElementPtrInst(object: object, property: property, propertyType: elType, structType: structType, irName: irName))
    }
    
    // TODO: compound extracting
    
//    func buildStdlibStructExtract(object: Operand, type: String, property: String, irName: String? = nil) throws -> StructExtractInst {
//        guard case let alias as TypeAlias = object.type, case let structType as StructType = alias.targetType else { throw VIRError.noType(#file) }
//        let elType = try structType.propertyType(property)
//        let s = StructExtractInst(object: object, property: property, propertyType: elType.usingTypesIn(module), structType: structType, irName: irName)
//        try addToCurrentBlock(s)
//        return s
//    }
}