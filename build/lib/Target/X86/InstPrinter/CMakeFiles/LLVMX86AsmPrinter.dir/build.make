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
include lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/depend.make

# Include the progress variables for this target.
include lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/progress.make

# Include the compile flags for this target's objects.
include lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/flags.make

lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86ATTInstPrinter.cpp.o: lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/flags.make
lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86ATTInstPrinter.cpp.o: /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/X86/InstPrinter/X86ATTInstPrinter.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86ATTInstPrinter.cpp.o"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/X86/InstPrinter && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/LLVMX86AsmPrinter.dir/X86ATTInstPrinter.cpp.o -c /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/X86/InstPrinter/X86ATTInstPrinter.cpp

lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86ATTInstPrinter.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LLVMX86AsmPrinter.dir/X86ATTInstPrinter.cpp.i"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/X86/InstPrinter && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/X86/InstPrinter/X86ATTInstPrinter.cpp > CMakeFiles/LLVMX86AsmPrinter.dir/X86ATTInstPrinter.cpp.i

lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86ATTInstPrinter.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LLVMX86AsmPrinter.dir/X86ATTInstPrinter.cpp.s"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/X86/InstPrinter && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/X86/InstPrinter/X86ATTInstPrinter.cpp -o CMakeFiles/LLVMX86AsmPrinter.dir/X86ATTInstPrinter.cpp.s

lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86ATTInstPrinter.cpp.o.requires:

.PHONY : lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86ATTInstPrinter.cpp.o.requires

lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86ATTInstPrinter.cpp.o.provides: lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86ATTInstPrinter.cpp.o.requires
	$(MAKE) -f lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/build.make lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86ATTInstPrinter.cpp.o.provides.build
.PHONY : lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86ATTInstPrinter.cpp.o.provides

lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86ATTInstPrinter.cpp.o.provides.build: lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86ATTInstPrinter.cpp.o


lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86IntelInstPrinter.cpp.o: lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/flags.make
lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86IntelInstPrinter.cpp.o: /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/X86/InstPrinter/X86IntelInstPrinter.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86IntelInstPrinter.cpp.o"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/X86/InstPrinter && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/LLVMX86AsmPrinter.dir/X86IntelInstPrinter.cpp.o -c /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/X86/InstPrinter/X86IntelInstPrinter.cpp

lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86IntelInstPrinter.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LLVMX86AsmPrinter.dir/X86IntelInstPrinter.cpp.i"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/X86/InstPrinter && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/X86/InstPrinter/X86IntelInstPrinter.cpp > CMakeFiles/LLVMX86AsmPrinter.dir/X86IntelInstPrinter.cpp.i

lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86IntelInstPrinter.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LLVMX86AsmPrinter.dir/X86IntelInstPrinter.cpp.s"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/X86/InstPrinter && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/X86/InstPrinter/X86IntelInstPrinter.cpp -o CMakeFiles/LLVMX86AsmPrinter.dir/X86IntelInstPrinter.cpp.s

lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86IntelInstPrinter.cpp.o.requires:

.PHONY : lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86IntelInstPrinter.cpp.o.requires

lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86IntelInstPrinter.cpp.o.provides: lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86IntelInstPrinter.cpp.o.requires
	$(MAKE) -f lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/build.make lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86IntelInstPrinter.cpp.o.provides.build
.PHONY : lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86IntelInstPrinter.cpp.o.provides

lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86IntelInstPrinter.cpp.o.provides.build: lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86IntelInstPrinter.cpp.o


lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86InstComments.cpp.o: lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/flags.make
lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86InstComments.cpp.o: /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/X86/InstPrinter/X86InstComments.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86InstComments.cpp.o"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/X86/InstPrinter && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/LLVMX86AsmPrinter.dir/X86InstComments.cpp.o -c /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/X86/InstPrinter/X86InstComments.cpp

lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86InstComments.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LLVMX86AsmPrinter.dir/X86InstComments.cpp.i"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/X86/InstPrinter && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/X86/InstPrinter/X86InstComments.cpp > CMakeFiles/LLVMX86AsmPrinter.dir/X86InstComments.cpp.i

lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86InstComments.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LLVMX86AsmPrinter.dir/X86InstComments.cpp.s"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/X86/InstPrinter && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/X86/InstPrinter/X86InstComments.cpp -o CMakeFiles/LLVMX86AsmPrinter.dir/X86InstComments.cpp.s

lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86InstComments.cpp.o.requires:

.PHONY : lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86InstComments.cpp.o.requires

lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86InstComments.cpp.o.provides: lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86InstComments.cpp.o.requires
	$(MAKE) -f lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/build.make lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86InstComments.cpp.o.provides.build
.PHONY : lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86InstComments.cpp.o.provides

lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86InstComments.cpp.o.provides.build: lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86InstComments.cpp.o


# Object files for target LLVMX86AsmPrinter
LLVMX86AsmPrinter_OBJECTS = \
"CMakeFiles/LLVMX86AsmPrinter.dir/X86ATTInstPrinter.cpp.o" \
"CMakeFiles/LLVMX86AsmPrinter.dir/X86IntelInstPrinter.cpp.o" \
"CMakeFiles/LLVMX86AsmPrinter.dir/X86InstComments.cpp.o"

# External object files for target LLVMX86AsmPrinter
LLVMX86AsmPrinter_EXTERNAL_OBJECTS =

lib/libLLVMX86AsmPrinter.a: lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86ATTInstPrinter.cpp.o
lib/libLLVMX86AsmPrinter.a: lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86IntelInstPrinter.cpp.o
lib/libLLVMX86AsmPrinter.a: lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86InstComments.cpp.o
lib/libLLVMX86AsmPrinter.a: lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/build.make
lib/libLLVMX86AsmPrinter.a: lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX static library ../../../libLLVMX86AsmPrinter.a"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/X86/InstPrinter && $(CMAKE_COMMAND) -P CMakeFiles/LLVMX86AsmPrinter.dir/cmake_clean_target.cmake
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/X86/InstPrinter && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/LLVMX86AsmPrinter.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/build: lib/libLLVMX86AsmPrinter.a

.PHONY : lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/build

lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/requires: lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86ATTInstPrinter.cpp.o.requires
lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/requires: lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86IntelInstPrinter.cpp.o.requires
lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/requires: lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/X86InstComments.cpp.o.requires

.PHONY : lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/requires

lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/clean:
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/X86/InstPrinter && $(CMAKE_COMMAND) -P CMakeFiles/LLVMX86AsmPrinter.dir/cmake_clean.cmake
.PHONY : lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/clean

lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/depend:
	cd /Users/JoeWillsher/developer/swift_llvm/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/JoeWillsher/developer/swift_llvm/llvm /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/X86/InstPrinter /Users/JoeWillsher/developer/swift_llvm/build /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/X86/InstPrinter /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/Target/X86/InstPrinter/CMakeFiles/LLVMX86AsmPrinter.dir/depend

