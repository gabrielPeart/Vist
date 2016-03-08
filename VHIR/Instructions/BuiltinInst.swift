//
//  BuiltinInst.swift
//  Vist
//
//  Created by Josef Willsher on 02/03/2016.
//  Copyright © 2016 vistlang. All rights reserved.
//


final class BuiltinInstCall: InstBase {
    override var type: Ty? { return returnType }
    let inst: BuiltinInst
    var instName: String { return inst.rawValue }
    var returnType: Ty
    
    private init(inst: BuiltinInst, args: [Operand], returnType: Ty, irName: String? = nil) {
        self.inst = inst
        self.returnType = returnType
        super.init()
        self.args = args
        self.irName = irName
    }
    
    // utils for bin instructions
    var l: Operand { return args[0] }
    var r: Operand { return args[1] }
    
    override var instVHIR: String {
        let a = args.map{$0.valueName}
        let w = a.joinWithSeparator(", ")
        switch inst {
        case .condfail:
            return "cond_fail \(w)"
        default:
            return "\(name) = builtin \(instName) \(w) \(useComment)"
        }
    }
    
}

enum BuiltinInst: String {
    case iadd = "i_add", isub = "i_sub", imul = "i_mul", idiv = "i_div"
    case condfail = "cond_fail"
    
    var expectedNumOperands: Int {
        switch  self {
        case .iadd, .isub, .imul, .idiv: return 2
        case .condfail: return 1
        }
    }
}


extension Builder {
    
    func buildBuiltinCall(i: BuiltinInst, args: Operand..., returnType: Ty, irName: String? = nil) throws -> BuiltinInstCall {
        guard args.count == i.expectedNumOperands else { throw VHIRError.builtinIncorrectOperands(inst: i, recieved: args.count) }
        let binInst = BuiltinInstCall(inst: i, args: args, returnType: returnType, irName: irName)
        try addToCurrentBlock(binInst)
        return binInst
    }
}