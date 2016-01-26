//
//  Optimiser.cpp
//  Vist
//
//  Created by Josef Willsher on 25/01/2016.
//  Copyright © 2016 vistlang. All rights reserved.
//

#include "Optimiser.hpp"
#include "InitialiserPass.hpp"

#include "llvm/PassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/PassInfo.h"
#include "llvm/PassSupport.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Function.h"
#include "llvm/Pass.h"

#include "llvm/Transforms/Instrumentation.h"
#include "llvm/Transforms/IPO.h"
#include "llvm/LTO/LTOModule.h"
#include "llvm/LTO/LTOCodeGenerator.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Transforms/Vectorize.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Analysis/Passes.h"


using namespace llvm;

// swift impl here https://github.com/apple/swift/blob/master/lib/IRGen/IRGen.cpp

/// Runs the optimisations
void performLLVMOptimisations(Module *Module, int optLevel) {
    
    PassManagerBuilder PMBuilder;
    
    PMBuilder.OptLevel = optLevel;
    PMBuilder.Inliner = optLevel > 0 ? llvm::createFunctionInliningPass(200) : nullptr;
    PMBuilder.SLPVectorize = optLevel > 0;
    PMBuilder.LoopVectorize = optLevel > 0;
    PMBuilder.MergeFunctions = optLevel > 0;
    
    PMBuilder.addExtension(PassManagerBuilder::EP_EarlyAsPossible,  // Run first thing
                           addInitialiserSimplificationPass);       // The initialiaser pass
    
    // Configure the function passes.
    legacy::FunctionPassManager FunctionPasses(Module);

    FunctionPasses.add(createVerifierPass());
    
    if (optLevel == 0) { // we want some optimisations, even at -O0
        FunctionPasses.add(createBasicAliasAnalysisPass());
        FunctionPasses.add(createInstructionCombiningPass());
        
        // needed as compiler produces a lot of redundant memory code assuming it will be optimied away
        FunctionPasses.add(createPromoteMemoryToRegisterPass());
        
        FunctionPasses.add(createReassociatePass());
        FunctionPasses.add(createConstantPropagationPass());
    }
    
    PMBuilder.populateFunctionPassManager(FunctionPasses);
    // TODO: Dont run all optimisations in -O0
    // TODO: also make it so you *can* run this and not the command line `opt` tool
    
    FunctionPasses.doInitialization();
    for (auto I = Module->begin(), E = Module->end(); I != E; ++I)
        if (!I->isDeclaration())
            FunctionPasses.run(*I);
    FunctionPasses.doFinalization();
    
    // Configure the module passes.
    legacy::PassManager ModulePasses;
    PMBuilder.populateModulePassManager(ModulePasses);
    
    ModulePasses.add(createVerifierPass());
    
    /// add custom module passes here
    // eg... ModulePasses.add(<#createAnyModulePass()#>);
    
    // then run optimisations
    ModulePasses.run(*Module);
    
    legacy::PassManager LTOPasses;
    /// add custom link time optimisations
//    LTOPasses.addLTOOptimizationPasses(<#createAnyLTOPass()#>);
    PMBuilder.populateLTOPassManager(LTOPasses);
}

/// Called from swift code
void performLLVMOptimisations(LLVMModuleRef mod, int optLevel) {
    Module *module = unwrap(mod);
    performLLVMOptimisations(module, optLevel);
}

