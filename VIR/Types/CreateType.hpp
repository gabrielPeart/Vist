//
//  CreateType.hpp
//  Vist
//
//  Created by Josef Willsher on 10/02/2016.
//  Copyright © 2016 vistlang. All rights reserved.
//

#ifndef CreateType_hpp
#define CreateType_hpp

#include <stdio.h>
#include "LLVM.h"

#ifdef __cplusplus
extern "C" {
#endif
    
    _Nullable LLVMTypeRef getNamedType(const char * _Nonnull name,
                                       LLVMModuleRef _Nonnull module);
    _Nonnull LLVMTypeRef createNamedType(LLVMTypeRef _Nonnull type,
                                         const char * _Nonnull name);
    
#ifdef __cplusplus
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wall"

#include "llvm/IR/Value.h"
#include "llvm/IR/Module.h"

#pragma clang diagnostic pop

using namespace llvm;

Type *_Nullable getNamedType(StringRef name, Module *_Nonnull module);
Type *_Nonnull createNamedType(Type *_Nonnull type, StringRef name);

#endif

#endif /* CreateType_hpp */
