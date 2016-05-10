#!/bin/bash

printf 'Configure\n'

# if no utils file, we create one and define the source root
printf
if [ ! -a Vist/Compiler/Include/Utils.h ]
    then
         printf "//\n//  Utils.h\n//  Vist\n//\n//  Created by Josef Willsher on 03/02/2016.\n//  Copyright © 2016 vistlang. All rights reserved.\n//\n\n#ifndef Utils_h\n#define Utils_h\n\n#define SOURCE_ROOT \"$(pwd)\"\n\n#endif /* Utils_h */\n" > Vist/Compiler/Include/Utils.h
fi

printf 'Download LLVM & Clang\n'

if [ ! -d /usr/local/cellar/llvm/3.6.2 ]
    then
        brew install llvm --with-clang #--with-lldb
fi

printf 'Build vist compiler\n'

# install 'vist'
xcodebuild -scheme Vist -configuration "Release" DEPLOYMENT_LOCATION=YES DSTROOT="" -project Vist.xcodeproj | sed -nE '/error:/,/^[[:digit:]] errors? generated/ p'

printf 'Install vistlib standard library & runtime\n'

# install 'libvist'
vist -build-stdlib

printf 'Done\n'


######## MOVE TO THIS -- LLVM in this dir ########

# download
# svn co http://llvm.org/svn/llvm-project/llvm/branches/release_36 llvm/llvm
# svn co http://llvm.org/svn/llvm-project/cfe/branches/release_36 llvm/clang

# make build dir
# mkdir llvm/build
# cd llvm/build

# build llvm
# cmake -G Unix Makefiles -DCMAKE_BUILD_TYPE=Release ../llvm
# cmake -G Unix Makefiles -DCMAKE_BUILD_TYPE=Release ../clang
# make install -j8

# done
