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
include lib/Target/CMakeFiles/LLVMTarget.dir/depend.make

# Include the progress variables for this target.
include lib/Target/CMakeFiles/LLVMTarget.dir/progress.make

# Include the compile flags for this target's objects.
include lib/Target/CMakeFiles/LLVMTarget.dir/flags.make

lib/Target/CMakeFiles/LLVMTarget.dir/Target.cpp.o: lib/Target/CMakeFiles/LLVMTarget.dir/flags.make
lib/Target/CMakeFiles/LLVMTarget.dir/Target.cpp.o: /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Target.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object lib/Target/CMakeFiles/LLVMTarget.dir/Target.cpp.o"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/LLVMTarget.dir/Target.cpp.o -c /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Target.cpp

lib/Target/CMakeFiles/LLVMTarget.dir/Target.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LLVMTarget.dir/Target.cpp.i"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Target.cpp > CMakeFiles/LLVMTarget.dir/Target.cpp.i

lib/Target/CMakeFiles/LLVMTarget.dir/Target.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LLVMTarget.dir/Target.cpp.s"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Target.cpp -o CMakeFiles/LLVMTarget.dir/Target.cpp.s

lib/Target/CMakeFiles/LLVMTarget.dir/Target.cpp.o.requires:

.PHONY : lib/Target/CMakeFiles/LLVMTarget.dir/Target.cpp.o.requires

lib/Target/CMakeFiles/LLVMTarget.dir/Target.cpp.o.provides: lib/Target/CMakeFiles/LLVMTarget.dir/Target.cpp.o.requires
	$(MAKE) -f lib/Target/CMakeFiles/LLVMTarget.dir/build.make lib/Target/CMakeFiles/LLVMTarget.dir/Target.cpp.o.provides.build
.PHONY : lib/Target/CMakeFiles/LLVMTarget.dir/Target.cpp.o.provides

lib/Target/CMakeFiles/LLVMTarget.dir/Target.cpp.o.provides.build: lib/Target/CMakeFiles/LLVMTarget.dir/Target.cpp.o


lib/Target/CMakeFiles/LLVMTarget.dir/TargetIntrinsicInfo.cpp.o: lib/Target/CMakeFiles/LLVMTarget.dir/flags.make
lib/Target/CMakeFiles/LLVMTarget.dir/TargetIntrinsicInfo.cpp.o: /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/TargetIntrinsicInfo.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object lib/Target/CMakeFiles/LLVMTarget.dir/TargetIntrinsicInfo.cpp.o"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/LLVMTarget.dir/TargetIntrinsicInfo.cpp.o -c /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/TargetIntrinsicInfo.cpp

lib/Target/CMakeFiles/LLVMTarget.dir/TargetIntrinsicInfo.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LLVMTarget.dir/TargetIntrinsicInfo.cpp.i"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/TargetIntrinsicInfo.cpp > CMakeFiles/LLVMTarget.dir/TargetIntrinsicInfo.cpp.i

lib/Target/CMakeFiles/LLVMTarget.dir/TargetIntrinsicInfo.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LLVMTarget.dir/TargetIntrinsicInfo.cpp.s"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/TargetIntrinsicInfo.cpp -o CMakeFiles/LLVMTarget.dir/TargetIntrinsicInfo.cpp.s

lib/Target/CMakeFiles/LLVMTarget.dir/TargetIntrinsicInfo.cpp.o.requires:

.PHONY : lib/Target/CMakeFiles/LLVMTarget.dir/TargetIntrinsicInfo.cpp.o.requires

lib/Target/CMakeFiles/LLVMTarget.dir/TargetIntrinsicInfo.cpp.o.provides: lib/Target/CMakeFiles/LLVMTarget.dir/TargetIntrinsicInfo.cpp.o.requires
	$(MAKE) -f lib/Target/CMakeFiles/LLVMTarget.dir/build.make lib/Target/CMakeFiles/LLVMTarget.dir/TargetIntrinsicInfo.cpp.o.provides.build
.PHONY : lib/Target/CMakeFiles/LLVMTarget.dir/TargetIntrinsicInfo.cpp.o.provides

lib/Target/CMakeFiles/LLVMTarget.dir/TargetIntrinsicInfo.cpp.o.provides.build: lib/Target/CMakeFiles/LLVMTarget.dir/TargetIntrinsicInfo.cpp.o


lib/Target/CMakeFiles/LLVMTarget.dir/TargetLoweringObjectFile.cpp.o: lib/Target/CMakeFiles/LLVMTarget.dir/flags.make
lib/Target/CMakeFiles/LLVMTarget.dir/TargetLoweringObjectFile.cpp.o: /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/TargetLoweringObjectFile.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object lib/Target/CMakeFiles/LLVMTarget.dir/TargetLoweringObjectFile.cpp.o"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/LLVMTarget.dir/TargetLoweringObjectFile.cpp.o -c /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/TargetLoweringObjectFile.cpp

lib/Target/CMakeFiles/LLVMTarget.dir/TargetLoweringObjectFile.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LLVMTarget.dir/TargetLoweringObjectFile.cpp.i"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/TargetLoweringObjectFile.cpp > CMakeFiles/LLVMTarget.dir/TargetLoweringObjectFile.cpp.i

lib/Target/CMakeFiles/LLVMTarget.dir/TargetLoweringObjectFile.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LLVMTarget.dir/TargetLoweringObjectFile.cpp.s"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/TargetLoweringObjectFile.cpp -o CMakeFiles/LLVMTarget.dir/TargetLoweringObjectFile.cpp.s

lib/Target/CMakeFiles/LLVMTarget.dir/TargetLoweringObjectFile.cpp.o.requires:

.PHONY : lib/Target/CMakeFiles/LLVMTarget.dir/TargetLoweringObjectFile.cpp.o.requires

lib/Target/CMakeFiles/LLVMTarget.dir/TargetLoweringObjectFile.cpp.o.provides: lib/Target/CMakeFiles/LLVMTarget.dir/TargetLoweringObjectFile.cpp.o.requires
	$(MAKE) -f lib/Target/CMakeFiles/LLVMTarget.dir/build.make lib/Target/CMakeFiles/LLVMTarget.dir/TargetLoweringObjectFile.cpp.o.provides.build
.PHONY : lib/Target/CMakeFiles/LLVMTarget.dir/TargetLoweringObjectFile.cpp.o.provides

lib/Target/CMakeFiles/LLVMTarget.dir/TargetLoweringObjectFile.cpp.o.provides.build: lib/Target/CMakeFiles/LLVMTarget.dir/TargetLoweringObjectFile.cpp.o


lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachine.cpp.o: lib/Target/CMakeFiles/LLVMTarget.dir/flags.make
lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachine.cpp.o: /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/TargetMachine.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachine.cpp.o"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/LLVMTarget.dir/TargetMachine.cpp.o -c /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/TargetMachine.cpp

lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachine.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LLVMTarget.dir/TargetMachine.cpp.i"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/TargetMachine.cpp > CMakeFiles/LLVMTarget.dir/TargetMachine.cpp.i

lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachine.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LLVMTarget.dir/TargetMachine.cpp.s"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/TargetMachine.cpp -o CMakeFiles/LLVMTarget.dir/TargetMachine.cpp.s

lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachine.cpp.o.requires:

.PHONY : lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachine.cpp.o.requires

lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachine.cpp.o.provides: lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachine.cpp.o.requires
	$(MAKE) -f lib/Target/CMakeFiles/LLVMTarget.dir/build.make lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachine.cpp.o.provides.build
.PHONY : lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachine.cpp.o.provides

lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachine.cpp.o.provides.build: lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachine.cpp.o


lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachineC.cpp.o: lib/Target/CMakeFiles/LLVMTarget.dir/flags.make
lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachineC.cpp.o: /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/TargetMachineC.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachineC.cpp.o"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/LLVMTarget.dir/TargetMachineC.cpp.o -c /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/TargetMachineC.cpp

lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachineC.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LLVMTarget.dir/TargetMachineC.cpp.i"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/TargetMachineC.cpp > CMakeFiles/LLVMTarget.dir/TargetMachineC.cpp.i

lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachineC.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LLVMTarget.dir/TargetMachineC.cpp.s"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/TargetMachineC.cpp -o CMakeFiles/LLVMTarget.dir/TargetMachineC.cpp.s

lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachineC.cpp.o.requires:

.PHONY : lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachineC.cpp.o.requires

lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachineC.cpp.o.provides: lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachineC.cpp.o.requires
	$(MAKE) -f lib/Target/CMakeFiles/LLVMTarget.dir/build.make lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachineC.cpp.o.provides.build
.PHONY : lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachineC.cpp.o.provides

lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachineC.cpp.o.provides.build: lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachineC.cpp.o


lib/Target/CMakeFiles/LLVMTarget.dir/TargetRecip.cpp.o: lib/Target/CMakeFiles/LLVMTarget.dir/flags.make
lib/Target/CMakeFiles/LLVMTarget.dir/TargetRecip.cpp.o: /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/TargetRecip.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object lib/Target/CMakeFiles/LLVMTarget.dir/TargetRecip.cpp.o"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/LLVMTarget.dir/TargetRecip.cpp.o -c /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/TargetRecip.cpp

lib/Target/CMakeFiles/LLVMTarget.dir/TargetRecip.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LLVMTarget.dir/TargetRecip.cpp.i"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/TargetRecip.cpp > CMakeFiles/LLVMTarget.dir/TargetRecip.cpp.i

lib/Target/CMakeFiles/LLVMTarget.dir/TargetRecip.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LLVMTarget.dir/TargetRecip.cpp.s"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/TargetRecip.cpp -o CMakeFiles/LLVMTarget.dir/TargetRecip.cpp.s

lib/Target/CMakeFiles/LLVMTarget.dir/TargetRecip.cpp.o.requires:

.PHONY : lib/Target/CMakeFiles/LLVMTarget.dir/TargetRecip.cpp.o.requires

lib/Target/CMakeFiles/LLVMTarget.dir/TargetRecip.cpp.o.provides: lib/Target/CMakeFiles/LLVMTarget.dir/TargetRecip.cpp.o.requires
	$(MAKE) -f lib/Target/CMakeFiles/LLVMTarget.dir/build.make lib/Target/CMakeFiles/LLVMTarget.dir/TargetRecip.cpp.o.provides.build
.PHONY : lib/Target/CMakeFiles/LLVMTarget.dir/TargetRecip.cpp.o.provides

lib/Target/CMakeFiles/LLVMTarget.dir/TargetRecip.cpp.o.provides.build: lib/Target/CMakeFiles/LLVMTarget.dir/TargetRecip.cpp.o


lib/Target/CMakeFiles/LLVMTarget.dir/TargetSubtargetInfo.cpp.o: lib/Target/CMakeFiles/LLVMTarget.dir/flags.make
lib/Target/CMakeFiles/LLVMTarget.dir/TargetSubtargetInfo.cpp.o: /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/TargetSubtargetInfo.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object lib/Target/CMakeFiles/LLVMTarget.dir/TargetSubtargetInfo.cpp.o"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/LLVMTarget.dir/TargetSubtargetInfo.cpp.o -c /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/TargetSubtargetInfo.cpp

lib/Target/CMakeFiles/LLVMTarget.dir/TargetSubtargetInfo.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LLVMTarget.dir/TargetSubtargetInfo.cpp.i"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/TargetSubtargetInfo.cpp > CMakeFiles/LLVMTarget.dir/TargetSubtargetInfo.cpp.i

lib/Target/CMakeFiles/LLVMTarget.dir/TargetSubtargetInfo.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LLVMTarget.dir/TargetSubtargetInfo.cpp.s"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/TargetSubtargetInfo.cpp -o CMakeFiles/LLVMTarget.dir/TargetSubtargetInfo.cpp.s

lib/Target/CMakeFiles/LLVMTarget.dir/TargetSubtargetInfo.cpp.o.requires:

.PHONY : lib/Target/CMakeFiles/LLVMTarget.dir/TargetSubtargetInfo.cpp.o.requires

lib/Target/CMakeFiles/LLVMTarget.dir/TargetSubtargetInfo.cpp.o.provides: lib/Target/CMakeFiles/LLVMTarget.dir/TargetSubtargetInfo.cpp.o.requires
	$(MAKE) -f lib/Target/CMakeFiles/LLVMTarget.dir/build.make lib/Target/CMakeFiles/LLVMTarget.dir/TargetSubtargetInfo.cpp.o.provides.build
.PHONY : lib/Target/CMakeFiles/LLVMTarget.dir/TargetSubtargetInfo.cpp.o.provides

lib/Target/CMakeFiles/LLVMTarget.dir/TargetSubtargetInfo.cpp.o.provides.build: lib/Target/CMakeFiles/LLVMTarget.dir/TargetSubtargetInfo.cpp.o


# Object files for target LLVMTarget
LLVMTarget_OBJECTS = \
"CMakeFiles/LLVMTarget.dir/Target.cpp.o" \
"CMakeFiles/LLVMTarget.dir/TargetIntrinsicInfo.cpp.o" \
"CMakeFiles/LLVMTarget.dir/TargetLoweringObjectFile.cpp.o" \
"CMakeFiles/LLVMTarget.dir/TargetMachine.cpp.o" \
"CMakeFiles/LLVMTarget.dir/TargetMachineC.cpp.o" \
"CMakeFiles/LLVMTarget.dir/TargetRecip.cpp.o" \
"CMakeFiles/LLVMTarget.dir/TargetSubtargetInfo.cpp.o"

# External object files for target LLVMTarget
LLVMTarget_EXTERNAL_OBJECTS =

lib/libLLVMTarget.a: lib/Target/CMakeFiles/LLVMTarget.dir/Target.cpp.o
lib/libLLVMTarget.a: lib/Target/CMakeFiles/LLVMTarget.dir/TargetIntrinsicInfo.cpp.o
lib/libLLVMTarget.a: lib/Target/CMakeFiles/LLVMTarget.dir/TargetLoweringObjectFile.cpp.o
lib/libLLVMTarget.a: lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachine.cpp.o
lib/libLLVMTarget.a: lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachineC.cpp.o
lib/libLLVMTarget.a: lib/Target/CMakeFiles/LLVMTarget.dir/TargetRecip.cpp.o
lib/libLLVMTarget.a: lib/Target/CMakeFiles/LLVMTarget.dir/TargetSubtargetInfo.cpp.o
lib/libLLVMTarget.a: lib/Target/CMakeFiles/LLVMTarget.dir/build.make
lib/libLLVMTarget.a: lib/Target/CMakeFiles/LLVMTarget.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking CXX static library ../libLLVMTarget.a"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target && $(CMAKE_COMMAND) -P CMakeFiles/LLVMTarget.dir/cmake_clean_target.cmake
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/LLVMTarget.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/Target/CMakeFiles/LLVMTarget.dir/build: lib/libLLVMTarget.a

.PHONY : lib/Target/CMakeFiles/LLVMTarget.dir/build

lib/Target/CMakeFiles/LLVMTarget.dir/requires: lib/Target/CMakeFiles/LLVMTarget.dir/Target.cpp.o.requires
lib/Target/CMakeFiles/LLVMTarget.dir/requires: lib/Target/CMakeFiles/LLVMTarget.dir/TargetIntrinsicInfo.cpp.o.requires
lib/Target/CMakeFiles/LLVMTarget.dir/requires: lib/Target/CMakeFiles/LLVMTarget.dir/TargetLoweringObjectFile.cpp.o.requires
lib/Target/CMakeFiles/LLVMTarget.dir/requires: lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachine.cpp.o.requires
lib/Target/CMakeFiles/LLVMTarget.dir/requires: lib/Target/CMakeFiles/LLVMTarget.dir/TargetMachineC.cpp.o.requires
lib/Target/CMakeFiles/LLVMTarget.dir/requires: lib/Target/CMakeFiles/LLVMTarget.dir/TargetRecip.cpp.o.requires
lib/Target/CMakeFiles/LLVMTarget.dir/requires: lib/Target/CMakeFiles/LLVMTarget.dir/TargetSubtargetInfo.cpp.o.requires

.PHONY : lib/Target/CMakeFiles/LLVMTarget.dir/requires

lib/Target/CMakeFiles/LLVMTarget.dir/clean:
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target && $(CMAKE_COMMAND) -P CMakeFiles/LLVMTarget.dir/cmake_clean.cmake
.PHONY : lib/Target/CMakeFiles/LLVMTarget.dir/clean

lib/Target/CMakeFiles/LLVMTarget.dir/depend:
	cd /Users/JoeWillsher/developer/swift_llvm/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/JoeWillsher/developer/swift_llvm/llvm /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target /Users/JoeWillsher/developer/swift_llvm/build /Users/JoeWillsher/developer/swift_llvm/build/lib/Target /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/CMakeFiles/LLVMTarget.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/Target/CMakeFiles/LLVMTarget.dir/depend

