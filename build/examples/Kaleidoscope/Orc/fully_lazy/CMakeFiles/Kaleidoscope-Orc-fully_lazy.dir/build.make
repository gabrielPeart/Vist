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
include examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/depend.make

# Include the progress variables for this target.
include examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/progress.make

# Include the compile flags for this target's objects.
include examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/flags.make

examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/toy.cpp.o: examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/flags.make
examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/toy.cpp.o: /Users/JoeWillsher/developer/swift_llvm/llvm/examples/Kaleidoscope/Orc/fully_lazy/toy.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/toy.cpp.o"
	cd /Users/JoeWillsher/developer/swift_llvm/build/examples/Kaleidoscope/Orc/fully_lazy && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/toy.cpp.o -c /Users/JoeWillsher/developer/swift_llvm/llvm/examples/Kaleidoscope/Orc/fully_lazy/toy.cpp

examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/toy.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/toy.cpp.i"
	cd /Users/JoeWillsher/developer/swift_llvm/build/examples/Kaleidoscope/Orc/fully_lazy && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/JoeWillsher/developer/swift_llvm/llvm/examples/Kaleidoscope/Orc/fully_lazy/toy.cpp > CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/toy.cpp.i

examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/toy.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/toy.cpp.s"
	cd /Users/JoeWillsher/developer/swift_llvm/build/examples/Kaleidoscope/Orc/fully_lazy && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/JoeWillsher/developer/swift_llvm/llvm/examples/Kaleidoscope/Orc/fully_lazy/toy.cpp -o CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/toy.cpp.s

examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/toy.cpp.o.requires:

.PHONY : examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/toy.cpp.o.requires

examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/toy.cpp.o.provides: examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/toy.cpp.o.requires
	$(MAKE) -f examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/build.make examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/toy.cpp.o.provides.build
.PHONY : examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/toy.cpp.o.provides

examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/toy.cpp.o.provides.build: examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/toy.cpp.o


# Object files for target Kaleidoscope-Orc-fully_lazy
Kaleidoscope__Orc__fully_lazy_OBJECTS = \
"CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/toy.cpp.o"

# External object files for target Kaleidoscope-Orc-fully_lazy
Kaleidoscope__Orc__fully_lazy_EXTERNAL_OBJECTS =

bin/Kaleidoscope-Orc-fully_lazy: examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/toy.cpp.o
bin/Kaleidoscope-Orc-fully_lazy: examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/build.make
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMCore.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMExecutionEngine.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMObject.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMOrcJIT.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMRuntimeDyld.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMSupport.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMX86CodeGen.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMX86AsmPrinter.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMX86AsmParser.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMX86Desc.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMX86Info.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMX86Disassembler.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMExecutionEngine.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMRuntimeDyld.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMX86CodeGen.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMAsmPrinter.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMSelectionDAG.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMCodeGen.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMTarget.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMBitWriter.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMInstrumentation.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMScalarOpts.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMInstCombine.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMTransformUtils.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMAnalysis.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMX86Desc.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMObject.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMBitReader.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMX86AsmPrinter.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMX86Utils.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMCore.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMMCParser.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMX86Info.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMMCDisassembler.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMMC.a
bin/Kaleidoscope-Orc-fully_lazy: lib/libLLVMSupport.a
bin/Kaleidoscope-Orc-fully_lazy: examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../../bin/Kaleidoscope-Orc-fully_lazy"
	cd /Users/JoeWillsher/developer/swift_llvm/build/examples/Kaleidoscope/Orc/fully_lazy && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/build: bin/Kaleidoscope-Orc-fully_lazy

.PHONY : examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/build

examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/requires: examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/toy.cpp.o.requires

.PHONY : examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/requires

examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/clean:
	cd /Users/JoeWillsher/developer/swift_llvm/build/examples/Kaleidoscope/Orc/fully_lazy && $(CMAKE_COMMAND) -P CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/cmake_clean.cmake
.PHONY : examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/clean

examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/depend:
	cd /Users/JoeWillsher/developer/swift_llvm/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/JoeWillsher/developer/swift_llvm/llvm /Users/JoeWillsher/developer/swift_llvm/llvm/examples/Kaleidoscope/Orc/fully_lazy /Users/JoeWillsher/developer/swift_llvm/build /Users/JoeWillsher/developer/swift_llvm/build/examples/Kaleidoscope/Orc/fully_lazy /Users/JoeWillsher/developer/swift_llvm/build/examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/Kaleidoscope/Orc/fully_lazy/CMakeFiles/Kaleidoscope-Orc-fully_lazy.dir/depend

