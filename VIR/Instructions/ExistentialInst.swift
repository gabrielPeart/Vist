//
//  ExistentialInst.swift
//  Vist
//
//  Created by Josef Willsher on 26/03/2016.
//  Copyright © 2016 vistlang. All rights reserved.
//


/// Opening an existential box to get a pointer to a member
final class ExistentialProjectPropertyInst : Inst, LValue {
    var existential: PtrOperand
    let propertyName: String, existentialType: ConceptType
    
    var propertyType: Type { return try! existentialType.propertyType(name: propertyName) }
    
    var memType: Type? { return propertyType.isClassType() ? propertyType.ptrType() : propertyType }
    var type: Type? { return propertyType.isClassType() ? propertyType.ptrType().ptrType() : propertyType.ptrType() }
    
    var uses: [Operand] = []
    var args: [Operand]
    
    convenience init(existential: LValue, propertyName: String, irName: String? = nil) throws {
        
        guard let existentialType = try existential.memType?.getAsConceptType() else {
            fatalError("todo throw -- not existential type")
        }
        self.init(existential: PtrOperand(existential), propertyName: propertyName, existentialType: existentialType, irName: irName)
    }
    
    private init(existential: PtrOperand, propertyName: String, existentialType: ConceptType, irName: String?) {
        self.existential = existential
        self.propertyName = propertyName
        self.existentialType = existentialType
        self.args = [existential]
        initialiseArgs()
        self.irName = irName
    }
    
    var vir: String {
        return "\(name) = existential_project_member \(existential.valueName), !\(propertyName)\(useComment)"
    }
    
    func copy() -> ExistentialProjectPropertyInst {
        return ExistentialProjectPropertyInst(existential: existential.formCopy(), propertyName: propertyName, existentialType: existentialType, irName: irName)
    }
    
    func setArgs(_ args: [Operand]) {
        existential = args[0] as! PtrOperand
    }
    var parentBlock: BasicBlock?
    var irName: String?
}

/// Constructing an existential box from a conforming instance.
///
/// When lowered it calculates the metadata for offsets and constructs
/// the struct's witness table
final class ExistentialConstructInst : Inst, LValue {
    var value: Operand
    let existentialType: ConceptType
    let witnessTable: VIRWitnessTable
    var isLocal: Bool
    
    var memType: Type? { return existentialType.importedType(in: module) }
    var type: Type? { return memType?.ptrType() }
    
    var uses: [Operand] = []
    var args: [Operand]
    
    convenience init(value: Value, existentialType: ConceptType, module: Module, irName: String? = nil) throws {
        guard case let nom as NominalType = value.type?.getBasePointeeType() else {
            fatalError("Expected a nominal type")
        }
        if nom.isClassType(), !value.type!.isPointerType() {
            fatalError("Class types should pass in the shared heap ptr")
        }
        self.init(value: Operand(value),
                  witnessTable: .create(module: module, type: nom, conforms: existentialType),
                  existentialType: existentialType,
                  irName: irName)
    }
    
    private init(value: Operand, witnessTable: VIRWitnessTable, existentialType: ConceptType, irName: String?) {
        self.witnessTable = witnessTable
        self.isLocal = true
        self.value = value
        self.existentialType = existentialType
        self.args = [value]
        initialiseArgs()
        self.irName = irName
    }
    
    var vir: String {
        return "\(name) = \(isLocal ? "existential_construct" : "existential_construct_nonlocal") \(value.valueName) in #\(existentialType.explicitName)\(useComment)"
    }
    
    func copy() -> ExistentialConstructInst {
        return ExistentialConstructInst(value: value.formCopy(), witnessTable: witnessTable, existentialType: existentialType, irName: irName)
    }
    func setArgs(_ args: [Operand]) {
        value = args[0]
    }
    var parentBlock: BasicBlock?
    var irName: String?
}

final class ExistentialWitnessInst : Inst, LValue {
    var existential: PtrOperand
    let methodName: String
    let existentialType: ConceptType
    
    var methodType: FunctionType
    var type: Type? { return memType.map { BuiltinType.pointer(to: $0) } }
    var memType: Type? { return methodType }
    
    var uses: [Operand] = []
    var args: [Operand]
    
    convenience init(existential: LValue,
                     methodName: String,
                     existentialType: ConceptType,
                     irName: String? = nil) throws {
        guard let methodType = existentialType.methods.first(where: {$0.name == methodName}) else {
            fatalError()
        }
        self.init(existential: PtrOperand(existential),
                  methodName: methodName,
                  methodType: methodType.type,
                  existentialType: existentialType,
                  irName: irName)
    }
    
    private init(existential: PtrOperand, methodName: String, methodType: FunctionType, existentialType: ConceptType, irName: String?) {
        self.existential = existential
        self.methodName = methodName
        self.methodType = methodType
        self.existentialType = existentialType
        self.args = [existential]
        initialiseArgs()
        self.irName = irName
    }
    
    var vir: String {
        return "\(name) = existential_witness \(existential.valueName), !\(methodName)\(useComment)"
    }
    
    func copy() -> ExistentialWitnessInst {
        return ExistentialWitnessInst(existential: existential.formCopy(),
                                      methodName: methodName,
                                      methodType: methodType,
                                      existentialType: existentialType,
                                      irName: irName)
    }
    
    func setArgs(_ args: [Operand]) {
        existential = args[0] as! PtrOperand
    }
    
    var parentBlock: BasicBlock?
    var irName: String?
}

/// Get the instance from the existential box, an i8*
final class ExistentialProjectInst : Inst, LValue {
    var existential: PtrOperand
    
    var type: Type? { return BuiltinType.opaquePointer }
    var memType: Type? { return BuiltinType.int(size: 8) }
    
    var uses: [Operand] = []
    var args: [Operand] = []
    
    convenience init(existential: LValue, irName: String? = nil) {
        self.init(existential: PtrOperand(existential), irName: irName)
    }
    
    private init(existential: PtrOperand, irName: String?) {
        self.existential = existential
        self.args = [existential]
        initialiseArgs()
        self.irName = irName
    }
    
    var vir: String {
        return "\(name) = existential_project \(existential.valueName)\(useComment)"
    }
    
    func copy() -> ExistentialProjectInst {
        return ExistentialProjectInst(existential: existential.formCopy(), irName: irName)
    }
    func setArgs(_ args: [Operand]) {
        existential = args[0] as! PtrOperand
    }
    var parentBlock: BasicBlock?
    var irName: String?
}

/// Places the existential buffer on the heap
final class ExistentialExportBufferInst : Inst {
    var existential: PtrOperand
    
    var type: Type? { return nil }
    
    var uses: [Operand] = []
    var args: [Operand]
    
    convenience init(existential: LValue, irName: String? = nil) throws {
        self.init(existential: PtrOperand(existential), irName: irName)
    }
    
    private init(existential: PtrOperand, irName: String?) {
        self.existential = existential
        self.args = [existential]
        initialiseArgs()
        self.irName = irName
    }
    
    var hasSideEffects: Bool { return true }
    
    var vir: String {
        return "existential_export_buffer \(existential.valueName)\(useComment) // id: \(name)"
    }
    
    func copy() -> ExistentialExportBufferInst {
        return ExistentialExportBufferInst(existential: existential.formCopy(), irName: irName)
    }
    
    func setArgs(_ args: [Operand]) {
        existential = args[0] as! PtrOperand
    }
    var parentBlock: BasicBlock?
    var irName: String?
}
