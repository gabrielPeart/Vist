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
include examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/depend.make

# Include the progress variables for this target.
include examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/progress.make

# Include the compile flags for this target's objects.
include examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/flags.make

examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/toy.cpp.o: examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/flags.make
examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/toy.cpp.o: /Users/JoeWillsher/developer/swift_llvm/llvm/examples/Kaleidoscope/Chapter8/toy.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/toy.cpp.o"
	cd /Users/JoeWillsher/developer/swift_llvm/build/examples/Kaleidoscope/Chapter8 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/Kaleidoscope-Ch8.dir/toy.cpp.o -c /Users/JoeWillsher/developer/swift_llvm/llvm/examples/Kaleidoscope/Chapter8/toy.cpp

examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/toy.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Kaleidoscope-Ch8.dir/toy.cpp.i"
	cd /Users/JoeWillsher/developer/swift_llvm/build/examples/Kaleidoscope/Chapter8 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/JoeWillsher/developer/swift_llvm/llvm/examples/Kaleidoscope/Chapter8/toy.cpp > CMakeFiles/Kaleidoscope-Ch8.dir/toy.cpp.i

examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/toy.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Kaleidoscope-Ch8.dir/toy.cpp.s"
	cd /Users/JoeWillsher/developer/swift_llvm/build/examples/Kaleidoscope/Chapter8 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/JoeWillsher/developer/swift_llvm/llvm/examples/Kaleidoscope/Chapter8/toy.cpp -o CMakeFiles/Kaleidoscope-Ch8.dir/toy.cpp.s

examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/toy.cpp.o.requires:

.PHONY : examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/toy.cpp.o.requires

examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/toy.cpp.o.provides: examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/toy.cpp.o.requires
	$(MAKE) -f examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/build.make examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/toy.cpp.o.provides.build
.PHONY : examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/toy.cpp.o.provides

examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/toy.cpp.o.provides.build: examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/toy.cpp.o


# Object files for target Kaleidoscope-Ch8
Kaleidoscope__Ch8_OBJECTS = \
"CMakeFiles/Kaleidoscope-Ch8.dir/toy.cpp.o"

# External object files for target Kaleidoscope-Ch8
Kaleidoscope__Ch8_EXTERNAL_OBJECTS =

bin/Kaleidoscope-Ch8: examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/toy.cpp.o
bin/Kaleidoscope-Ch8: examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/build.make
bin/Kaleidoscope-Ch8: lib/libLLVMCore.a
bin/Kaleidoscope-Ch8: lib/libLLVMExecutionEngine.a
bin/Kaleidoscope-Ch8: lib/libLLVMObject.a
bin/Kaleidoscope-Ch8: lib/libLLVMSupport.a
bin/Kaleidoscope-Ch8: lib/libLLVMX86CodeGen.a
bin/Kaleidoscope-Ch8: lib/libLLVMX86AsmPrinter.a
bin/Kaleidoscope-Ch8: lib/libLLVMX86AsmParser.a
bin/Kaleidoscope-Ch8: lib/libLLVMX86Desc.a
bin/Kaleidoscope-Ch8: lib/libLLVMX86Info.a
bin/Kaleidoscope-Ch8: lib/libLLVMX86Disassembler.a
bin/Kaleidoscope-Ch8: lib/libLLVMRuntimeDyld.a
bin/Kaleidoscope-Ch8: lib/libLLVMX86CodeGen.a
bin/Kaleidoscope-Ch8: lib/libLLVMAsmPrinter.a
bin/Kaleidoscope-Ch8: lib/libLLVMSelectionDAG.a
bin/Kaleidoscope-Ch8: lib/libLLVMCodeGen.a
bin/Kaleidoscope-Ch8: lib/libLLVMTarget.a
bin/Kaleidoscope-Ch8: lib/libLLVMBitWriter.a
bin/Kaleidoscope-Ch8: lib/libLLVMInstrumentation.a
bin/Kaleidoscope-Ch8: lib/libLLVMScalarOpts.a
bin/Kaleidoscope-Ch8: lib/libLLVMInstCombine.a
bin/Kaleidoscope-Ch8: lib/libLLVMTransformUtils.a
bin/Kaleidoscope-Ch8: lib/libLLVMAnalysis.a
bin/Kaleidoscope-Ch8: lib/libLLVMX86Desc.a
bin/Kaleidoscope-Ch8: lib/libLLVMObject.a
bin/Kaleidoscope-Ch8: lib/libLLVMBitReader.a
bin/Kaleidoscope-Ch8: lib/libLLVMX86AsmPrinter.a
bin/Kaleidoscope-Ch8: lib/libLLVMX86Utils.a
bin/Kaleidoscope-Ch8: lib/libLLVMCore.a
bin/Kaleidoscope-Ch8: lib/libLLVMMCParser.a
bin/Kaleidoscope-Ch8: lib/libLLVMX86Info.a
bin/Kaleidoscope-Ch8: lib/libLLVMMCDisassembler.a
bin/Kaleidoscope-Ch8: lib/libLLVMMC.a
bin/Kaleidoscope-Ch8: lib/libLLVMSupport.a
bin/Kaleidoscope-Ch8: examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../bin/Kaleidoscope-Ch8"
	cd /Users/JoeWillsher/developer/swift_llvm/build/examples/Kaleidoscope/Chapter8 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Kaleidoscope-Ch8.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/build: bin/Kaleidoscope-Ch8

.PHONY : examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/build

examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/requires: examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/toy.cpp.o.requires

.PHONY : examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/requires

examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/clean:
	cd /Users/JoeWillsher/developer/swift_llvm/build/examples/Kaleidoscope/Chapter8 && $(CMAKE_COMMAND) -P CMakeFiles/Kaleidoscope-Ch8.dir/cmake_clean.cmake
.PHONY : examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/clean

examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/depend:
	cd /Users/JoeWillsher/developer/swift_llvm/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/JoeWillsher/developer/swift_llvm/llvm /Users/JoeWillsher/developer/swift_llvm/llvm/examples/Kaleidoscope/Chapter8 /Users/JoeWillsher/developer/swift_llvm/build /Users/JoeWillsher/developer/swift_llvm/build/examples/Kaleidoscope/Chapter8 /Users/JoeWillsher/developer/swift_llvm/build/examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/Kaleidoscope/Chapter8/CMakeFiles/Kaleidoscope-Ch8.dir/depend

