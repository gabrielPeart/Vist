//
//  ReturnInst.swift
//  Vist
//
//  Created by Josef Willsher on 29/02/2016.
//  Copyright © 2016 vistlang. All rights reserved.
//


/**
 A return inst, returns from the current function
 
 `return %a`
 */
final class ReturnInst : InstBase {
    var returnValue: Operand
    
    convenience init(value: Value, parentBlock: BasicBlock?) {
        self.init(op: Operand(value))
        self.parentBlock = parentBlock
    }
    private init(op: Operand) {
        self.returnValue = op
        super.init(args: [op], irName: nil)
    }
    
    override var instVIR: String {
        return "return \(returnValue.name)"
    }
    
    override var type: Type? { return nil }
    
    override var hasSideEffects: Bool { return true }
    override var isTerminator: Bool { return true }
    
    
    override func copyInst() -> ReturnInst {
        return ReturnInst(op: returnValue)
    }
}


extension Builder {
    
    @discardableResult
    func buildReturnVoid() throws -> ReturnInst {
        return try buildReturn(value: VoidLiteralValue())
    }
    
    @discardableResult
    func buildReturn(value: Value) throws -> ReturnInst {
        return try build(inst: ReturnInst(value: value, parentBlock: insertPoint.block))
    }
}
