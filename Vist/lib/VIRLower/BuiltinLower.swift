//
//  BuiltinLower.swift
//  Vist
//
//  Created by Josef Willsher on 22/04/2016.
//  Copyright © 2016 vistlang. All rights reserved.
//


extension BuiltinInstCall: VIRLower {
    
    func virLower(igf: inout IRGenFunction) throws -> LLVMValue {
        
        // applied args
        // self provides `lhs` and `rhs` which are lazily computed args[0] and args[1]
        var args = self.args.map { $0.loweredValue! as LLVMValue }
        // An intrinsic to call with args
        let intrinsic: LLVMFunction
        
        switch inst {
        // overflowing arithmetic
        case .iadd: intrinsic = try igf.module.getIntrinsic(.i_add_overflow, overload: lhs.type)
        case .imul: intrinsic = try igf.module.getIntrinsic(.i_mul_overflow, overload: lhs.type)
        case .isub: intrinsic = try igf.module.getIntrinsic(.i_sub_overflow, overload: lhs.type)
        case .ipow:
            intrinsic = try igf.module.getIntrinsic(.i_pow, overload: .double)
            // make sure rhs is i32
            switch rhs.type.size(unit: .bits, igf: igf) {
            case 32: break
            case 0..<32: args[1] = try igf.builder.buildSext(val: args[1], size: 32)
            case 33...64: args[1] = try igf.builder.buildTrunc(val: args[1], size: 32)
            default: fatalError("bad int type")
            }
            args[0] = try igf.builder.buildIntToFloat(val: args[0], floatType: .double)
            let call = try igf.builder.buildCall(function: intrinsic, args: args, name: irName)
            return try igf.builder.buildFloatToInt(val: call, intType: lhs.type)
            
        // other intrinsics
        case .expect: intrinsic = try igf.module.getIntrinsic(.expect, overload: lhs.type)
        case .trap:   intrinsic = try igf.module.getIntrinsic(.trap)
        case .memcpy:
            // overload types -- we want `@llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1)`
            // construct intrinsic
            intrinsic = try igf.module.getIntrinsic(.memcopy,
                                                    overload: lhs.type, rhs.type, .intType(size: 64))
            // add extra memcpy args
            args.append(.constInt(value: 1, size: 32)) // i32 align -- align 1
            args.append(.constBool(value: false)) // i1 isVolatile -- false
            
        case .withptr:
            let alloc = try igf.builder.buildAlloca(type: lhs.type)
            try igf.builder.buildStore(value: lhs, in: alloc)
            return try igf.builder.buildBitcast(value: alloc, to: LLVMType.opaquePointer)
            
        case .isuniquelyreferenced:
            let alloc = try igf.builder.buildAlloca(type: lhs.type)
            try igf.builder.buildStore(value: lhs, in: alloc)
            
            let exType = Runtime.existentialObjectType.importedCanType(in: module).getPointerType()
            let ex = try igf.builder.buildBitcast(value: alloc, to: exType)
            
            let project = module.getRuntimeFunction(.getBufferProjection, igf: &igf)
            let projection = try igf.builder.buildCall(function: project, args: [ex])
            
            let isUnique = module.getRuntimeFunction(.isUniquelyReferenced, igf: &igf)
            let boxType = Runtime.refcountedObjectPointerType.importedCanType(in: module)
            let box = try igf.builder.buildBitcast(value: projection, to: boxType)
            
            return try igf.builder.buildCall(function: isUnique, args: [box])
            
        case .allocstack: return try igf.builder.buildArrayAlloca(size: lhs, elementType: .intType(size: 8), name: irName)
        case .allocheap:  return try igf.builder.buildArrayMalloc(size: lhs, elementType: .intType(size: 8), name: irName)
        case .heapfree:   return try igf.builder.buildFree(ptr: lhs, name: irName)
            
        case .advancepointer: return try igf.builder.buildGEP(ofAggregate: lhs, index: rhs, name: irName)
        case .opaqueload:     return try igf.builder.buildLoad(from: lhs, name: irName)
        case .opaquestore:    return try igf.builder.buildStore(value: rhs, in: lhs)
            
        case .condfail:
            guard let fn = parentFunction, let current = parentBlock else { fatalError() }
            var success = try fn.loweredFunction!.appendBasicBlock(named: "\(current.name).cont"), fail = try fn.buildCondFailBlock(igf: &igf)
            
            success.move(after: current.loweredBlock!)
            try module.loweredBuilder.buildCondBr(if: lhs, to: fail, elseTo: success)
            try parentBlock!.splitBlock(backEdge: &success, igf: &igf)
            module.loweredBuilder.position(atEndOf: success)
            return .nullptr
            
        // handle calls which arent intrinsics, but builtin
        // instructions. We can just call them directly, and return
        case .iaddunchecked: return try igf.builder.buildIAdd(lhs: lhs, rhs: rhs, name: irName)
        case .imulunchecked: return try igf.builder.buildIMul(lhs: lhs, rhs: rhs, name: irName)
        case .idiv: return try igf.builder.buildIDiv(lhs: lhs, rhs: rhs, name: irName)
        case .irem: return try igf.builder.buildIRem(lhs: lhs, rhs: rhs, name: irName)
        case .ieq, .beq:   return try igf.builder.buildIntCompare(.equal, lhs: lhs, rhs: rhs, name: irName)
        case .ineq, .bneq: return try igf.builder.buildIntCompare(.notEqual, lhs: lhs, rhs: rhs)
        case .ilt:  return try igf.builder.buildIntCompare(.lessThan, lhs: lhs, rhs: rhs, name: irName)
        case .igt:  return try igf.builder.buildIntCompare(.greaterThan, lhs: lhs, rhs: rhs, name: irName)
        case .ilte: return try igf.builder.buildIntCompare(.lessThanEqual, lhs: lhs, rhs: rhs, name: irName)
        case .igte: return try igf.builder.buildIntCompare(.greaterThanEqual, lhs: lhs, rhs: rhs, name: irName)
        case .ishl: return try igf.builder.buildIShiftL(lhs: lhs, rhs: rhs, name: irName)
        case .ishr: return try igf.builder.buildIShiftR(lhs: lhs, rhs: rhs, name: irName)
        case .iand, .and: return try igf.builder.buildAnd(lhs: lhs, rhs: rhs, name: irName)
        case .not:        return try igf.builder.buildNot(val: lhs, name: irName)
        case .ior, .or:   return try igf.builder.buildOr(lhs: lhs, rhs: rhs, name: irName)
        case .ixor:       return try igf.builder.buildXor(lhs: lhs, rhs: rhs, name: irName)
        
        case .fadd: return try igf.builder.buildFAdd(lhs: lhs, rhs: rhs, name: irName)
        case .fsub: return try igf.builder.buildFSub(lhs: lhs, rhs: rhs, name: irName)
        case .fmul: return try igf.builder.buildFMul(lhs: lhs, rhs: rhs, name: irName)
        case .fdiv: return try igf.builder.buildFDiv(lhs: lhs, rhs: rhs, name: irName)
        case .frem: return try igf.builder.buildFRem(lhs: lhs, rhs: rhs, name: irName)
        case .feq:  return try igf.builder.buildFloatCompare(.equal, lhs: lhs, rhs: rhs, name: irName)
        case .fneq: return try igf.builder.buildFloatCompare(.notEqual, lhs: lhs, rhs: rhs, name: irName)
        case .flt:  return try igf.builder.buildFloatCompare(.lessThan, lhs: lhs, rhs: rhs, name: irName)
        case .fgt:  return try igf.builder.buildFloatCompare(.greaterThan, lhs: lhs, rhs: rhs, name: irName)
        case .flte: return try igf.builder.buildFloatCompare(.lessThanEqual, lhs: lhs, rhs: rhs, name: irName)
        case .fgte: return try igf.builder.buildFloatCompare(.lessThanEqual, lhs: lhs, rhs: rhs, name: irName)
            
        case .trunc8:  return try igf.builder.buildTrunc(val: lhs, size: 8, name: irName)
        case .trunc16: return try igf.builder.buildTrunc(val: lhs, size: 16, name: irName)
        case .trunc32: return try igf.builder.buildTrunc(val: lhs, size: 32, name: irName)
        case .sext64: return try igf.builder.buildSext(val: lhs, size: 64, name: irName)
        case .zext64: return try igf.builder.buildZext(val: lhs, size: 64, name: irName)
        }
        
        // call the intrinsic
        let call = try igf.builder.buildCall(function: intrinsic, args: args, name: irName)
        if case .trap = inst { try igf.builder.buildUnreachable() }        
        return call
    }
}


extension Function {
    
    /// Constructs a function's faluire landing pad, or returns the one defined
    func buildCondFailBlock(igf: inout IRGenFunction) throws -> LLVMBasicBlock {
        // if its there already, we can use it
        if let condFailBlock = _condFailBlock { return condFailBlock }
        
        // make fail block & save current pos
        let ins = igf.builder.getInsertBlock()
        let block = try loweredFunction!.appendBasicBlock(named: "\(name.demangleName()).trap")
        igf.builder.position(atEndOf: block)
        
        // Build trap and unreachable
        _ = try BuiltinInstCall.trapInst().virLower(igf: &igf)
        
        // move back; save and return the fail block
        igf.builder.position(atEndOf: ins!)
        _condFailBlock = block
        return block
    }
    
}

private extension BasicBlock {
    
    /// Corrects any phi nodes which were changed by splitting the block
    /// - note moves the insert point away from the current position
    func splitBlock(backEdge new: inout LLVMBasicBlock, igf: inout IRGenFunction) throws {
        // for each phi which references this block
        for phiOperand in loweredBlock!.phiUses {
            let phi = loweredBlock!.phiUses.remove(phiOperand)!.loweredValue!
            
            // move after it, and build a replacement
            try igf.builder.position(after: phi)
            let newPhi = try igf.builder.buildPhi(type: phi.type)
            
            // add the incoming vals
            let range = 0 ..< Int(LLVMCountIncoming(phi._value!))
            let incoming = range.map { incomingIndex -> (value: LLVMValue, from: LLVMBasicBlock) in
                switch (phi.incomingBlock(at: incomingIndex), phi.incomingValue(at: incomingIndex)) {
                case (loweredBlock!, let val):
                    // repalce incoming from the old block with the new
                    return (value: val, from: new)
                case (let block, let val):
                    return (value: val, from: block)
                }
            }
            // add thses incoming to the phi
            newPhi.addPhiIncoming(incoming)
            phiOperand.setLoweredValue(newPhi)
            
            phi.eraseFromParent(replacingAllUsesWith: newPhi)
            newPhi.name = phi.name
            // move the phi uses from the old block to the new
            new.addPhiUse(phiOperand)
        }
        
        // set the current lowered block to be the continuation block
        loweredBlock = new
    }
}

