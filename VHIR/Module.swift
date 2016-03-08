//
//  Module.swift
//  Vist
//
//  Created by Josef Willsher on 29/02/2016.
//  Copyright © 2016 vistlang. All rights reserved.
//


/// The module type, functions get put into this
final class Module: VHIRElement {
    private(set) var functions: [Function] = []
    private(set) var typeList: [TypeAlias] = []
    private(set) var builder: Builder!
    var loweredModule: LLVMModuleRef = nil
    
    init() { builder = Builder(module: self) }
    var module: Module { return self }
}

extension Module {
    
    func insert(f: Function) {
        functions.append(f)
    }
    
    func insert(name: String, targetType: StorageType) {
        typeList.append(TypeAlias(name: name, targetType: targetType))
    }
    
    /// Returns the module's definition of `type`
    func getOrInsertAliasTo(type: StorageType) -> TypeAlias {
        if let t = typeList.indexOf({$0.targetType == type}) {
            return typeList[t]
        }
        else {
            insert(type.name, targetType: type)
            return getOrInsertAliasTo(type)
        }
    }
    
    func dumpIR() { if loweredModule != nil { LLVMDumpModule(loweredModule) } else { print("module <NULL>") } }
    func dump() { print(vhir) }
}

