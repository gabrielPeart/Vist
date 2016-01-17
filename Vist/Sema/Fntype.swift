//
//  FnType.swift
//  Vist
//
//  Created by Josef Willsher on 17/01/2016.
//  Copyright © 2016 vistlang. All rights reserved.
//


struct FnType : LLVMTyped {
    let params: [LLVMTyped]
    let returns: LLVMTyped
    
    func ir() -> LLVMTypeRef {
        
        let r: LLVMTypeRef
        if let _ = returns as? FnType {
            r = NativeType.Pointer(to: returns).ir()
        }
        else {
            r = returns.ir()
        }
        
        return LLVMFunctionType(
            r,
            nonVoid.map{$0.ir()}.ptr(),
            UInt32(nonVoid.count),
            LLVMBool(false))
    }
    
    
    var nonVoid: [LLVMTyped]  {
        return params.filter { if case NativeType.Void = $0 { return false } else { return true } }
    }
}
