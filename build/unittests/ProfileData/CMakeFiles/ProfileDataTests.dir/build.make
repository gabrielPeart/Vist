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
include unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/depend.make

# Include the progress variables for this target.
include unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/progress.make

# Include the compile flags for this target's objects.
include unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/flags.make

unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/CoverageMappingTest.cpp.o: unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/flags.make
unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/CoverageMappingTest.cpp.o: /Users/JoeWillsher/developer/swift_llvm/llvm/unittests/ProfileData/CoverageMappingTest.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/CoverageMappingTest.cpp.o"
	cd /Users/JoeWillsher/developer/swift_llvm/build/unittests/ProfileData && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/ProfileDataTests.dir/CoverageMappingTest.cpp.o -c /Users/JoeWillsher/developer/swift_llvm/llvm/unittests/ProfileData/CoverageMappingTest.cpp

unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/CoverageMappingTest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ProfileDataTests.dir/CoverageMappingTest.cpp.i"
	cd /Users/JoeWillsher/developer/swift_llvm/build/unittests/ProfileData && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/JoeWillsher/developer/swift_llvm/llvm/unittests/ProfileData/CoverageMappingTest.cpp > CMakeFiles/ProfileDataTests.dir/CoverageMappingTest.cpp.i

unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/CoverageMappingTest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ProfileDataTests.dir/CoverageMappingTest.cpp.s"
	cd /Users/JoeWillsher/developer/swift_llvm/build/unittests/ProfileData && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/JoeWillsher/developer/swift_llvm/llvm/unittests/ProfileData/CoverageMappingTest.cpp -o CMakeFiles/ProfileDataTests.dir/CoverageMappingTest.cpp.s

unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/CoverageMappingTest.cpp.o.requires:

.PHONY : unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/CoverageMappingTest.cpp.o.requires

unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/CoverageMappingTest.cpp.o.provides: unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/CoverageMappingTest.cpp.o.requires
	$(MAKE) -f unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/build.make unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/CoverageMappingTest.cpp.o.provides.build
.PHONY : unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/CoverageMappingTest.cpp.o.provides

unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/CoverageMappingTest.cpp.o.provides.build: unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/CoverageMappingTest.cpp.o


unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/InstrProfTest.cpp.o: unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/flags.make
unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/InstrProfTest.cpp.o: /Users/JoeWillsher/developer/swift_llvm/llvm/unittests/ProfileData/InstrProfTest.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/InstrProfTest.cpp.o"
	cd /Users/JoeWillsher/developer/swift_llvm/build/unittests/ProfileData && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/ProfileDataTests.dir/InstrProfTest.cpp.o -c /Users/JoeWillsher/developer/swift_llvm/llvm/unittests/ProfileData/InstrProfTest.cpp

unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/InstrProfTest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ProfileDataTests.dir/InstrProfTest.cpp.i"
	cd /Users/JoeWillsher/developer/swift_llvm/build/unittests/ProfileData && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/JoeWillsher/developer/swift_llvm/llvm/unittests/ProfileData/InstrProfTest.cpp > CMakeFiles/ProfileDataTests.dir/InstrProfTest.cpp.i

unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/InstrProfTest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ProfileDataTests.dir/InstrProfTest.cpp.s"
	cd /Users/JoeWillsher/developer/swift_llvm/build/unittests/ProfileData && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/JoeWillsher/developer/swift_llvm/llvm/unittests/ProfileData/InstrProfTest.cpp -o CMakeFiles/ProfileDataTests.dir/InstrProfTest.cpp.s

unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/InstrProfTest.cpp.o.requires:

.PHONY : unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/InstrProfTest.cpp.o.requires

unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/InstrProfTest.cpp.o.provides: unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/InstrProfTest.cpp.o.requires
	$(MAKE) -f unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/build.make unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/InstrProfTest.cpp.o.provides.build
.PHONY : unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/InstrProfTest.cpp.o.provides

unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/InstrProfTest.cpp.o.provides.build: unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/InstrProfTest.cpp.o


# Object files for target ProfileDataTests
ProfileDataTests_OBJECTS = \
"CMakeFiles/ProfileDataTests.dir/CoverageMappingTest.cpp.o" \
"CMakeFiles/ProfileDataTests.dir/InstrProfTest.cpp.o"

# External object files for target ProfileDataTests
ProfileDataTests_EXTERNAL_OBJECTS =

unittests/ProfileData/ProfileDataTests: unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/CoverageMappingTest.cpp.o
unittests/ProfileData/ProfileDataTests: unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/InstrProfTest.cpp.o
unittests/ProfileData/ProfileDataTests: unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/build.make
unittests/ProfileData/ProfileDataTests: lib/libLLVMCore.a
unittests/ProfileData/ProfileDataTests: lib/libLLVMProfileData.a
unittests/ProfileData/ProfileDataTests: lib/libLLVMSupport.a
unittests/ProfileData/ProfileDataTests: lib/libgtest.a
unittests/ProfileData/ProfileDataTests: lib/libgtest_main.a
unittests/ProfileData/ProfileDataTests: lib/libLLVMSupport.a
unittests/ProfileData/ProfileDataTests: lib/libLLVMObject.a
unittests/ProfileData/ProfileDataTests: lib/libLLVMBitReader.a
unittests/ProfileData/ProfileDataTests: lib/libLLVMCore.a
unittests/ProfileData/ProfileDataTests: lib/libLLVMMCParser.a
unittests/ProfileData/ProfileDataTests: lib/libLLVMMC.a
unittests/ProfileData/ProfileDataTests: lib/libgtest.a
unittests/ProfileData/ProfileDataTests: lib/libLLVMSupport.a
unittests/ProfileData/ProfileDataTests: unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable ProfileDataTests"
	cd /Users/JoeWillsher/developer/swift_llvm/build/unittests/ProfileData && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ProfileDataTests.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/build: unittests/ProfileData/ProfileDataTests

.PHONY : unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/build

unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/requires: unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/CoverageMappingTest.cpp.o.requires
unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/requires: unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/InstrProfTest.cpp.o.requires

.PHONY : unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/requires

unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/clean:
	cd /Users/JoeWillsher/developer/swift_llvm/build/unittests/ProfileData && $(CMAKE_COMMAND) -P CMakeFiles/ProfileDataTests.dir/cmake_clean.cmake
.PHONY : unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/clean

unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/depend:
	cd /Users/JoeWillsher/developer/swift_llvm/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/JoeWillsher/developer/swift_llvm/llvm /Users/JoeWillsher/developer/swift_llvm/llvm/unittests/ProfileData /Users/JoeWillsher/developer/swift_llvm/build /Users/JoeWillsher/developer/swift_llvm/build/unittests/ProfileData /Users/JoeWillsher/developer/swift_llvm/build/unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : unittests/ProfileData/CMakeFiles/ProfileDataTests.dir/depend

