# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.3

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CMake.app/Contents/bin/cmake

# The command to remove a file.
RM = /Applications/CMake.app/Contents/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/JoeWillsher/developer/swift_llvm/llvm

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/JoeWillsher/developer/swift_llvm/build

# Include any dependencies generated for this target.
include tools/llvm-lto/CMakeFiles/llvm-lto.dir/depend.make

# Include the progress variables for this target.
include tools/llvm-lto/CMakeFiles/llvm-lto.dir/progress.make

# Include the compile flags for this target's objects.
include tools/llvm-lto/CMakeFiles/llvm-lto.dir/flags.make

tools/llvm-lto/CMakeFiles/llvm-lto.dir/llvm-lto.cpp.o: tools/llvm-lto/CMakeFiles/llvm-lto.dir/flags.make
tools/llvm-lto/CMakeFiles/llvm-lto.dir/llvm-lto.cpp.o: /Users/JoeWillsher/developer/swift_llvm/llvm/tools/llvm-lto/llvm-lto.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tools/llvm-lto/CMakeFiles/llvm-lto.dir/llvm-lto.cpp.o"
	cd /Users/JoeWillsher/developer/swift_llvm/build/tools/llvm-lto && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/llvm-lto.dir/llvm-lto.cpp.o -c /Users/JoeWillsher/developer/swift_llvm/llvm/tools/llvm-lto/llvm-lto.cpp

tools/llvm-lto/CMakeFiles/llvm-lto.dir/llvm-lto.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/llvm-lto.dir/llvm-lto.cpp.i"
	cd /Users/JoeWillsher/developer/swift_llvm/build/tools/llvm-lto && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/JoeWillsher/developer/swift_llvm/llvm/tools/llvm-lto/llvm-lto.cpp > CMakeFiles/llvm-lto.dir/llvm-lto.cpp.i

tools/llvm-lto/CMakeFiles/llvm-lto.dir/llvm-lto.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/llvm-lto.dir/llvm-lto.cpp.s"
	cd /Users/JoeWillsher/developer/swift_llvm/build/tools/llvm-lto && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/JoeWillsher/developer/swift_llvm/llvm/tools/llvm-lto/llvm-lto.cpp -o CMakeFiles/llvm-lto.dir/llvm-lto.cpp.s

tools/llvm-lto/CMakeFiles/llvm-lto.dir/llvm-lto.cpp.o.requires:

.PHONY : tools/llvm-lto/CMakeFiles/llvm-lto.dir/llvm-lto.cpp.o.requires

tools/llvm-lto/CMakeFiles/llvm-lto.dir/llvm-lto.cpp.o.provides: tools/llvm-lto/CMakeFiles/llvm-lto.dir/llvm-lto.cpp.o.requires
	$(MAKE) -f tools/llvm-lto/CMakeFiles/llvm-lto.dir/build.make tools/llvm-lto/CMakeFiles/llvm-lto.dir/llvm-lto.cpp.o.provides.build
.PHONY : tools/llvm-lto/CMakeFiles/llvm-lto.dir/llvm-lto.cpp.o.provides

tools/llvm-lto/CMakeFiles/llvm-lto.dir/llvm-lto.cpp.o.provides.build: tools/llvm-lto/CMakeFiles/llvm-lto.dir/llvm-lto.cpp.o


# Object files for target llvm-lto
llvm__lto_OBJECTS = \
"CMakeFiles/llvm-lto.dir/llvm-lto.cpp.o"

# External object files for target llvm-lto
llvm__lto_EXTERNAL_OBJECTS =

bin/llvm-lto: tools/llvm-lto/CMakeFiles/llvm-lto.dir/llvm-lto.cpp.o
bin/llvm-lto: tools/llvm-lto/CMakeFiles/llvm-lto.dir/build.make
bin/llvm-lto: lib/libLLVMAArch64CodeGen.a
bin/llvm-lto: lib/libLLVMAArch64AsmPrinter.a
bin/llvm-lto: lib/libLLVMAArch64AsmParser.a
bin/llvm-lto: lib/libLLVMAArch64Desc.a
bin/llvm-lto: lib/libLLVMAArch64Info.a
bin/llvm-lto: lib/libLLVMAArch64Disassembler.a
bin/llvm-lto: lib/libLLVMAMDGPUCodeGen.a
bin/llvm-lto: lib/libLLVMAMDGPUAsmPrinter.a
bin/llvm-lto: lib/libLLVMAMDGPUAsmParser.a
bin/llvm-lto: lib/libLLVMAMDGPUDesc.a
bin/llvm-lto: lib/libLLVMAMDGPUInfo.a
bin/llvm-lto: lib/libLLVMARMCodeGen.a
bin/llvm-lto: lib/libLLVMARMAsmPrinter.a
bin/llvm-lto: lib/libLLVMARMAsmParser.a
bin/llvm-lto: lib/libLLVMARMDesc.a
bin/llvm-lto: lib/libLLVMARMInfo.a
bin/llvm-lto: lib/libLLVMARMDisassembler.a
bin/llvm-lto: lib/libLLVMBPFCodeGen.a
bin/llvm-lto: lib/libLLVMBPFAsmPrinter.a
bin/llvm-lto: lib/libLLVMBPFDesc.a
bin/llvm-lto: lib/libLLVMBPFInfo.a
bin/llvm-lto: lib/libLLVMCppBackendCodeGen.a
bin/llvm-lto: lib/libLLVMCppBackendInfo.a
bin/llvm-lto: lib/libLLVMHexagonCodeGen.a
bin/llvm-lto: lib/libLLVMHexagonAsmParser.a
bin/llvm-lto: lib/libLLVMHexagonDesc.a
bin/llvm-lto: lib/libLLVMHexagonInfo.a
bin/llvm-lto: lib/libLLVMHexagonDisassembler.a
bin/llvm-lto: lib/libLLVMMipsCodeGen.a
bin/llvm-lto: lib/libLLVMMipsAsmPrinter.a
bin/llvm-lto: lib/libLLVMMipsAsmParser.a
bin/llvm-lto: lib/libLLVMMipsDesc.a
bin/llvm-lto: lib/libLLVMMipsInfo.a
bin/llvm-lto: lib/libLLVMMipsDisassembler.a
bin/llvm-lto: lib/libLLVMMSP430CodeGen.a
bin/llvm-lto: lib/libLLVMMSP430AsmPrinter.a
bin/llvm-lto: lib/libLLVMMSP430Desc.a
bin/llvm-lto: lib/libLLVMMSP430Info.a
bin/llvm-lto: lib/libLLVMNVPTXCodeGen.a
bin/llvm-lto: lib/libLLVMNVPTXAsmPrinter.a
bin/llvm-lto: lib/libLLVMNVPTXDesc.a
bin/llvm-lto: lib/libLLVMNVPTXInfo.a
bin/llvm-lto: lib/libLLVMPowerPCCodeGen.a
bin/llvm-lto: lib/libLLVMPowerPCAsmPrinter.a
bin/llvm-lto: lib/libLLVMPowerPCAsmParser.a
bin/llvm-lto: lib/libLLVMPowerPCDesc.a
bin/llvm-lto: lib/libLLVMPowerPCInfo.a
bin/llvm-lto: lib/libLLVMPowerPCDisassembler.a
bin/llvm-lto: lib/libLLVMSparcCodeGen.a
bin/llvm-lto: lib/libLLVMSparcAsmPrinter.a
bin/llvm-lto: lib/libLLVMSparcAsmParser.a
bin/llvm-lto: lib/libLLVMSparcDesc.a
bin/llvm-lto: lib/libLLVMSparcInfo.a
bin/llvm-lto: lib/libLLVMSparcDisassembler.a
bin/llvm-lto: lib/libLLVMSystemZCodeGen.a
bin/llvm-lto: lib/libLLVMSystemZAsmPrinter.a
bin/llvm-lto: lib/libLLVMSystemZAsmParser.a
bin/llvm-lto: lib/libLLVMSystemZDesc.a
bin/llvm-lto: lib/libLLVMSystemZInfo.a
bin/llvm-lto: lib/libLLVMSystemZDisassembler.a
bin/llvm-lto: lib/libLLVMX86CodeGen.a
bin/llvm-lto: lib/libLLVMX86AsmPrinter.a
bin/llvm-lto: lib/libLLVMX86AsmParser.a
bin/llvm-lto: lib/libLLVMX86Desc.a
bin/llvm-lto: lib/libLLVMX86Info.a
bin/llvm-lto: lib/libLLVMX86Disassembler.a
bin/llvm-lto: lib/libLLVMXCoreCodeGen.a
bin/llvm-lto: lib/libLLVMXCoreAsmPrinter.a
bin/llvm-lto: lib/libLLVMXCoreDesc.a
bin/llvm-lto: lib/libLLVMXCoreInfo.a
bin/llvm-lto: lib/libLLVMXCoreDisassembler.a
bin/llvm-lto: lib/libLLVMBitWriter.a
bin/llvm-lto: lib/libLLVMCore.a
bin/llvm-lto: lib/libLLVMLTO.a
bin/llvm-lto: lib/libLLVMMC.a
bin/llvm-lto: lib/libLLVMObject.a
bin/llvm-lto: lib/libLLVMSupport.a
bin/llvm-lto: lib/libLLVMTarget.a
bin/llvm-lto: lib/libLLVMAArch64Desc.a
bin/llvm-lto: lib/libLLVMAArch64AsmPrinter.a
bin/llvm-lto: lib/libLLVMAArch64Info.a
bin/llvm-lto: lib/libLLVMAArch64Utils.a
bin/llvm-lto: lib/libLLVMAMDGPUAsmPrinter.a
bin/llvm-lto: lib/libLLVMAMDGPUUtils.a
bin/llvm-lto: lib/libLLVMARMDesc.a
bin/llvm-lto: lib/libLLVMARMAsmPrinter.a
bin/llvm-lto: lib/libLLVMARMInfo.a
bin/llvm-lto: lib/libLLVMBPFAsmPrinter.a
bin/llvm-lto: lib/libLLVMHexagonDesc.a
bin/llvm-lto: lib/libLLVMHexagonInfo.a
bin/llvm-lto: lib/libLLVMMipsAsmPrinter.a
bin/llvm-lto: lib/libLLVMMipsInfo.a
bin/llvm-lto: lib/libLLVMMSP430AsmPrinter.a
bin/llvm-lto: lib/libLLVMNVPTXAsmPrinter.a
bin/llvm-lto: lib/libLLVMPowerPCAsmPrinter.a
bin/llvm-lto: lib/libLLVMPowerPCInfo.a
bin/llvm-lto: lib/libLLVMSparcAsmPrinter.a
bin/llvm-lto: lib/libLLVMSparcInfo.a
bin/llvm-lto: lib/libLLVMSystemZDesc.a
bin/llvm-lto: lib/libLLVMSystemZAsmPrinter.a
bin/llvm-lto: lib/libLLVMSystemZInfo.a
bin/llvm-lto: lib/libLLVMX86CodeGen.a
bin/llvm-lto: lib/libLLVMX86Desc.a
bin/llvm-lto: lib/libLLVMX86AsmPrinter.a
bin/llvm-lto: lib/libLLVMX86Utils.a
bin/llvm-lto: lib/libLLVMX86Info.a
bin/llvm-lto: lib/libLLVMXCoreAsmPrinter.a
bin/llvm-lto: lib/libLLVMAsmPrinter.a
bin/llvm-lto: lib/libLLVMSelectionDAG.a
bin/llvm-lto: lib/libLLVMXCoreInfo.a
bin/llvm-lto: lib/libLLVMMCDisassembler.a
bin/llvm-lto: lib/libLLVMCodeGen.a
bin/llvm-lto: lib/libLLVMBitWriter.a
bin/llvm-lto: lib/libLLVMTarget.a
bin/llvm-lto: lib/libLLVMInstrumentation.a
bin/llvm-lto: lib/libLLVMipo.a
bin/llvm-lto: lib/libLLVMScalarOpts.a
bin/llvm-lto: lib/libLLVMIRReader.a
bin/llvm-lto: lib/libLLVMAsmParser.a
bin/llvm-lto: lib/libLLVMProfileData.a
bin/llvm-lto: lib/libLLVMObject.a
bin/llvm-lto: lib/libLLVMMCParser.a
bin/llvm-lto: lib/libLLVMMC.a
bin/llvm-lto: lib/libLLVMVectorize.a
bin/llvm-lto: lib/libLLVMBitReader.a
bin/llvm-lto: lib/libLLVMInstCombine.a
bin/llvm-lto: lib/libLLVMLinker.a
bin/llvm-lto: lib/libLLVMObjCARCOpts.a
bin/llvm-lto: lib/libLLVMTransformUtils.a
bin/llvm-lto: lib/libLLVMAnalysis.a
bin/llvm-lto: lib/libLLVMCore.a
bin/llvm-lto: lib/libLLVMSupport.a
bin/llvm-lto: tools/llvm-lto/CMakeFiles/llvm-lto.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/llvm-lto"
	cd /Users/JoeWillsher/developer/swift_llvm/build/tools/llvm-lto && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/llvm-lto.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tools/llvm-lto/CMakeFiles/llvm-lto.dir/build: bin/llvm-lto

.PHONY : tools/llvm-lto/CMakeFiles/llvm-lto.dir/build

tools/llvm-lto/CMakeFiles/llvm-lto.dir/requires: tools/llvm-lto/CMakeFiles/llvm-lto.dir/llvm-lto.cpp.o.requires

.PHONY : tools/llvm-lto/CMakeFiles/llvm-lto.dir/requires

tools/llvm-lto/CMakeFiles/llvm-lto.dir/clean:
	cd /Users/JoeWillsher/developer/swift_llvm/build/tools/llvm-lto && $(CMAKE_COMMAND) -P CMakeFiles/llvm-lto.dir/cmake_clean.cmake
.PHONY : tools/llvm-lto/CMakeFiles/llvm-lto.dir/clean

tools/llvm-lto/CMakeFiles/llvm-lto.dir/depend:
	cd /Users/JoeWillsher/developer/swift_llvm/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/JoeWillsher/developer/swift_llvm/llvm /Users/JoeWillsher/developer/swift_llvm/llvm/tools/llvm-lto /Users/JoeWillsher/developer/swift_llvm/build /Users/JoeWillsher/developer/swift_llvm/build/tools/llvm-lto /Users/JoeWillsher/developer/swift_llvm/build/tools/llvm-lto/CMakeFiles/llvm-lto.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tools/llvm-lto/CMakeFiles/llvm-lto.dir/depend

