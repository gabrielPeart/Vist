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
include tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/depend.make

# Include the progress variables for this target.
include tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/progress.make

# Include the compile flags for this target's objects.
include tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/flags.make

tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o: tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/flags.make
tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o: /Users/JoeWillsher/developer/swift_llvm/llvm/tools/llvm-bcanalyzer/llvm-bcanalyzer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o"
	cd /Users/JoeWillsher/developer/swift_llvm/build/tools/llvm-bcanalyzer && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o -c /Users/JoeWillsher/developer/swift_llvm/llvm/tools/llvm-bcanalyzer/llvm-bcanalyzer.cpp

tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.i"
	cd /Users/JoeWillsher/developer/swift_llvm/build/tools/llvm-bcanalyzer && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/JoeWillsher/developer/swift_llvm/llvm/tools/llvm-bcanalyzer/llvm-bcanalyzer.cpp > CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.i

tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.s"
	cd /Users/JoeWillsher/developer/swift_llvm/build/tools/llvm-bcanalyzer && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/JoeWillsher/developer/swift_llvm/llvm/tools/llvm-bcanalyzer/llvm-bcanalyzer.cpp -o CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.s

tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o.requires:

.PHONY : tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o.requires

tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o.provides: tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o.requires
	$(MAKE) -f tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/build.make tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o.provides.build
.PHONY : tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o.provides

tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o.provides.build: tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o


# Object files for target llvm-bcanalyzer
llvm__bcanalyzer_OBJECTS = \
"CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o"

# External object files for target llvm-bcanalyzer
llvm__bcanalyzer_EXTERNAL_OBJECTS =

bin/llvm-bcanalyzer: tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o
bin/llvm-bcanalyzer: tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/build.make
bin/llvm-bcanalyzer: lib/libLLVMBitReader.a
bin/llvm-bcanalyzer: lib/libLLVMSupport.a
bin/llvm-bcanalyzer: lib/libLLVMCore.a
bin/llvm-bcanalyzer: lib/libLLVMSupport.a
bin/llvm-bcanalyzer: tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/llvm-bcanalyzer"
	cd /Users/JoeWillsher/developer/swift_llvm/build/tools/llvm-bcanalyzer && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/llvm-bcanalyzer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/build: bin/llvm-bcanalyzer

.PHONY : tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/build

tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/requires: tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/llvm-bcanalyzer.cpp.o.requires

.PHONY : tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/requires

tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/clean:
	cd /Users/JoeWillsher/developer/swift_llvm/build/tools/llvm-bcanalyzer && $(CMAKE_COMMAND) -P CMakeFiles/llvm-bcanalyzer.dir/cmake_clean.cmake
.PHONY : tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/clean

tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/depend:
	cd /Users/JoeWillsher/developer/swift_llvm/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/JoeWillsher/developer/swift_llvm/llvm /Users/JoeWillsher/developer/swift_llvm/llvm/tools/llvm-bcanalyzer /Users/JoeWillsher/developer/swift_llvm/build /Users/JoeWillsher/developer/swift_llvm/build/tools/llvm-bcanalyzer /Users/JoeWillsher/developer/swift_llvm/build/tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tools/llvm-bcanalyzer/CMakeFiles/llvm-bcanalyzer.dir/depend

