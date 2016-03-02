//
//  Module.swift
//  Vist
//
//  Created by Josef Willsher on 29/02/2016.
//  Copyright © 2016 vistlang. All rights reserved.
//


/// The module type, functions get put into this
final class Module: VHIR {
    var functions: [Function] = []
    var typeList: [TypeAlias] = []
    var builder: Builder!
    
    init() {
        builder = Builder(module: self)
    }
}

extension Module {
    func addFunction(f: Function) -> Function {
        functions.append(f)
        return f
    }
    
    func addType(name: String, targetType: StorageType) {
        typeList.append(TypeAlias(name: name, targetType: targetType))
    }
    
    func getOrAddType(type: StorageType) -> Ty {
        if let t = typeList.indexOf({$0.targetType == type}) {
            return typeList[t]
        }
        else {
            addType(type.name, targetType: type)
            return getOrAddType(type)
        }
    }
}

