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

# Utility rule file for check-llvm-transforms-loopstrengthreduce-arm.

# Include the progress variables for this target.
include test/CMakeFiles/check-llvm-transforms-loopstrengthreduce-arm.dir/progress.make

test/CMakeFiles/check-llvm-transforms-loopstrengthreduce-arm:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running lit suite /Users/JoeWillsher/developer/swift_llvm/llvm/test/Transforms/LoopStrengthReduce/ARM"
	cd /Users/JoeWillsher/developer/swift_llvm/build/test && /usr/bin/python2.7 /Users/JoeWillsher/developer/swift_llvm/llvm/utils/lit/lit.py -sv --param llvm_site_config=/Users/JoeWillsher/developer/swift_llvm/build/test/lit.site.cfg --param llvm_unit_site_config=/Users/JoeWillsher/developer/swift_llvm/build/test/Unit/lit.site.cfg /Users/JoeWillsher/developer/swift_llvm/llvm/test/Transforms/LoopStrengthReduce/ARM

check-llvm-transforms-loopstrengthreduce-arm: test/CMakeFiles/check-llvm-transforms-loopstrengthreduce-arm
check-llvm-transforms-loopstrengthreduce-arm: test/CMakeFiles/check-llvm-transforms-loopstrengthreduce-arm.dir/build.make

.PHONY : check-llvm-transforms-loopstrengthreduce-arm

# Rule to build all files generated by this target.
test/CMakeFiles/check-llvm-transforms-loopstrengthreduce-arm.dir/build: check-llvm-transforms-loopstrengthreduce-arm

.PHONY : test/CMakeFiles/check-llvm-transforms-loopstrengthreduce-arm.dir/build

test/CMakeFiles/check-llvm-transforms-loopstrengthreduce-arm.dir/clean:
	cd /Users/JoeWillsher/developer/swift_llvm/build/test && $(CMAKE_COMMAND) -P CMakeFiles/check-llvm-transforms-loopstrengthreduce-arm.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/check-llvm-transforms-loopstrengthreduce-arm.dir/clean

test/CMakeFiles/check-llvm-transforms-loopstrengthreduce-arm.dir/depend:
	cd /Users/JoeWillsher/developer/swift_llvm/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/JoeWillsher/developer/swift_llvm/llvm /Users/JoeWillsher/developer/swift_llvm/llvm/test /Users/JoeWillsher/developer/swift_llvm/build /Users/JoeWillsher/developer/swift_llvm/build/test /Users/JoeWillsher/developer/swift_llvm/build/test/CMakeFiles/check-llvm-transforms-loopstrengthreduce-arm.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/check-llvm-transforms-loopstrengthreduce-arm.dir/depend

