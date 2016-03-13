//
//  DCE.swift
//  Vist
//
//  Created by Josef Willsher on 07/03/2016.
//  Copyright © 2016 vistlang. All rights reserved.
//



final class DCEPass: FunctionPass {
    
    init(optLevel: OptLevel) {}
    
    func runOn(function: Function) throws {
        
        for inst in function.instructions.reverse()
            where inst.uses.isEmpty && !inst.instHasSideEffects {
            try inst.eraseFromParent()
        }
        
    }
}

final class DeadFunctionPass: ModulePass {
    
    init(optLevel: OptLevel) {}
    
    func runOn(module: Module) throws {
        for _ in module.functions {
            // remove function if no users
            // need to implement function users if i want to do this
        }
    }
}



