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
include lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/depend.make

# Include the progress variables for this target.
include lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/progress.make

# Include the compile flags for this target's objects.
include lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/flags.make

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcAsmBackend.cpp.o: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/flags.make
lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcAsmBackend.cpp.o: /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc/SparcAsmBackend.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcAsmBackend.cpp.o"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Sparc/MCTargetDesc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/LLVMSparcDesc.dir/SparcAsmBackend.cpp.o -c /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc/SparcAsmBackend.cpp

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcAsmBackend.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LLVMSparcDesc.dir/SparcAsmBackend.cpp.i"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Sparc/MCTargetDesc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc/SparcAsmBackend.cpp > CMakeFiles/LLVMSparcDesc.dir/SparcAsmBackend.cpp.i

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcAsmBackend.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LLVMSparcDesc.dir/SparcAsmBackend.cpp.s"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Sparc/MCTargetDesc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc/SparcAsmBackend.cpp -o CMakeFiles/LLVMSparcDesc.dir/SparcAsmBackend.cpp.s

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcAsmBackend.cpp.o.requires:

.PHONY : lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcAsmBackend.cpp.o.requires

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcAsmBackend.cpp.o.provides: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcAsmBackend.cpp.o.requires
	$(MAKE) -f lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/build.make lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcAsmBackend.cpp.o.provides.build
.PHONY : lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcAsmBackend.cpp.o.provides

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcAsmBackend.cpp.o.provides.build: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcAsmBackend.cpp.o


lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcELFObjectWriter.cpp.o: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/flags.make
lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcELFObjectWriter.cpp.o: /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc/SparcELFObjectWriter.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcELFObjectWriter.cpp.o"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Sparc/MCTargetDesc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/LLVMSparcDesc.dir/SparcELFObjectWriter.cpp.o -c /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc/SparcELFObjectWriter.cpp

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcELFObjectWriter.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LLVMSparcDesc.dir/SparcELFObjectWriter.cpp.i"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Sparc/MCTargetDesc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc/SparcELFObjectWriter.cpp > CMakeFiles/LLVMSparcDesc.dir/SparcELFObjectWriter.cpp.i

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcELFObjectWriter.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LLVMSparcDesc.dir/SparcELFObjectWriter.cpp.s"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Sparc/MCTargetDesc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc/SparcELFObjectWriter.cpp -o CMakeFiles/LLVMSparcDesc.dir/SparcELFObjectWriter.cpp.s

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcELFObjectWriter.cpp.o.requires:

.PHONY : lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcELFObjectWriter.cpp.o.requires

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcELFObjectWriter.cpp.o.provides: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcELFObjectWriter.cpp.o.requires
	$(MAKE) -f lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/build.make lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcELFObjectWriter.cpp.o.provides.build
.PHONY : lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcELFObjectWriter.cpp.o.provides

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcELFObjectWriter.cpp.o.provides.build: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcELFObjectWriter.cpp.o


lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCAsmInfo.cpp.o: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/flags.make
lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCAsmInfo.cpp.o: /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc/SparcMCAsmInfo.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCAsmInfo.cpp.o"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Sparc/MCTargetDesc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/LLVMSparcDesc.dir/SparcMCAsmInfo.cpp.o -c /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc/SparcMCAsmInfo.cpp

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCAsmInfo.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LLVMSparcDesc.dir/SparcMCAsmInfo.cpp.i"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Sparc/MCTargetDesc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc/SparcMCAsmInfo.cpp > CMakeFiles/LLVMSparcDesc.dir/SparcMCAsmInfo.cpp.i

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCAsmInfo.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LLVMSparcDesc.dir/SparcMCAsmInfo.cpp.s"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Sparc/MCTargetDesc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc/SparcMCAsmInfo.cpp -o CMakeFiles/LLVMSparcDesc.dir/SparcMCAsmInfo.cpp.s

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCAsmInfo.cpp.o.requires:

.PHONY : lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCAsmInfo.cpp.o.requires

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCAsmInfo.cpp.o.provides: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCAsmInfo.cpp.o.requires
	$(MAKE) -f lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/build.make lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCAsmInfo.cpp.o.provides.build
.PHONY : lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCAsmInfo.cpp.o.provides

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCAsmInfo.cpp.o.provides.build: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCAsmInfo.cpp.o


lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCCodeEmitter.cpp.o: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/flags.make
lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCCodeEmitter.cpp.o: /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc/SparcMCCodeEmitter.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCCodeEmitter.cpp.o"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Sparc/MCTargetDesc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/LLVMSparcDesc.dir/SparcMCCodeEmitter.cpp.o -c /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc/SparcMCCodeEmitter.cpp

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCCodeEmitter.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LLVMSparcDesc.dir/SparcMCCodeEmitter.cpp.i"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Sparc/MCTargetDesc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc/SparcMCCodeEmitter.cpp > CMakeFiles/LLVMSparcDesc.dir/SparcMCCodeEmitter.cpp.i

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCCodeEmitter.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LLVMSparcDesc.dir/SparcMCCodeEmitter.cpp.s"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Sparc/MCTargetDesc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc/SparcMCCodeEmitter.cpp -o CMakeFiles/LLVMSparcDesc.dir/SparcMCCodeEmitter.cpp.s

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCCodeEmitter.cpp.o.requires:

.PHONY : lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCCodeEmitter.cpp.o.requires

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCCodeEmitter.cpp.o.provides: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCCodeEmitter.cpp.o.requires
	$(MAKE) -f lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/build.make lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCCodeEmitter.cpp.o.provides.build
.PHONY : lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCCodeEmitter.cpp.o.provides

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCCodeEmitter.cpp.o.provides.build: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCCodeEmitter.cpp.o


lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCTargetDesc.cpp.o: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/flags.make
lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCTargetDesc.cpp.o: /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc/SparcMCTargetDesc.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCTargetDesc.cpp.o"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Sparc/MCTargetDesc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/LLVMSparcDesc.dir/SparcMCTargetDesc.cpp.o -c /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc/SparcMCTargetDesc.cpp

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCTargetDesc.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LLVMSparcDesc.dir/SparcMCTargetDesc.cpp.i"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Sparc/MCTargetDesc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc/SparcMCTargetDesc.cpp > CMakeFiles/LLVMSparcDesc.dir/SparcMCTargetDesc.cpp.i

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCTargetDesc.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LLVMSparcDesc.dir/SparcMCTargetDesc.cpp.s"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Sparc/MCTargetDesc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc/SparcMCTargetDesc.cpp -o CMakeFiles/LLVMSparcDesc.dir/SparcMCTargetDesc.cpp.s

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCTargetDesc.cpp.o.requires:

.PHONY : lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCTargetDesc.cpp.o.requires

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCTargetDesc.cpp.o.provides: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCTargetDesc.cpp.o.requires
	$(MAKE) -f lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/build.make lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCTargetDesc.cpp.o.provides.build
.PHONY : lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCTargetDesc.cpp.o.provides

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCTargetDesc.cpp.o.provides.build: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCTargetDesc.cpp.o


lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCExpr.cpp.o: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/flags.make
lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCExpr.cpp.o: /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc/SparcMCExpr.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCExpr.cpp.o"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Sparc/MCTargetDesc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/LLVMSparcDesc.dir/SparcMCExpr.cpp.o -c /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc/SparcMCExpr.cpp

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCExpr.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LLVMSparcDesc.dir/SparcMCExpr.cpp.i"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Sparc/MCTargetDesc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc/SparcMCExpr.cpp > CMakeFiles/LLVMSparcDesc.dir/SparcMCExpr.cpp.i

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCExpr.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LLVMSparcDesc.dir/SparcMCExpr.cpp.s"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Sparc/MCTargetDesc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc/SparcMCExpr.cpp -o CMakeFiles/LLVMSparcDesc.dir/SparcMCExpr.cpp.s

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCExpr.cpp.o.requires:

.PHONY : lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCExpr.cpp.o.requires

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCExpr.cpp.o.provides: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCExpr.cpp.o.requires
	$(MAKE) -f lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/build.make lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCExpr.cpp.o.provides.build
.PHONY : lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCExpr.cpp.o.provides

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCExpr.cpp.o.provides.build: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCExpr.cpp.o


lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcTargetStreamer.cpp.o: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/flags.make
lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcTargetStreamer.cpp.o: /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc/SparcTargetStreamer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcTargetStreamer.cpp.o"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Sparc/MCTargetDesc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/LLVMSparcDesc.dir/SparcTargetStreamer.cpp.o -c /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc/SparcTargetStreamer.cpp

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcTargetStreamer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LLVMSparcDesc.dir/SparcTargetStreamer.cpp.i"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Sparc/MCTargetDesc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc/SparcTargetStreamer.cpp > CMakeFiles/LLVMSparcDesc.dir/SparcTargetStreamer.cpp.i

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcTargetStreamer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LLVMSparcDesc.dir/SparcTargetStreamer.cpp.s"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Sparc/MCTargetDesc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc/SparcTargetStreamer.cpp -o CMakeFiles/LLVMSparcDesc.dir/SparcTargetStreamer.cpp.s

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcTargetStreamer.cpp.o.requires:

.PHONY : lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcTargetStreamer.cpp.o.requires

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcTargetStreamer.cpp.o.provides: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcTargetStreamer.cpp.o.requires
	$(MAKE) -f lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/build.make lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcTargetStreamer.cpp.o.provides.build
.PHONY : lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcTargetStreamer.cpp.o.provides

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcTargetStreamer.cpp.o.provides.build: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcTargetStreamer.cpp.o


# Object files for target LLVMSparcDesc
LLVMSparcDesc_OBJECTS = \
"CMakeFiles/LLVMSparcDesc.dir/SparcAsmBackend.cpp.o" \
"CMakeFiles/LLVMSparcDesc.dir/SparcELFObjectWriter.cpp.o" \
"CMakeFiles/LLVMSparcDesc.dir/SparcMCAsmInfo.cpp.o" \
"CMakeFiles/LLVMSparcDesc.dir/SparcMCCodeEmitter.cpp.o" \
"CMakeFiles/LLVMSparcDesc.dir/SparcMCTargetDesc.cpp.o" \
"CMakeFiles/LLVMSparcDesc.dir/SparcMCExpr.cpp.o" \
"CMakeFiles/LLVMSparcDesc.dir/SparcTargetStreamer.cpp.o"

# External object files for target LLVMSparcDesc
LLVMSparcDesc_EXTERNAL_OBJECTS =

lib/libLLVMSparcDesc.a: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcAsmBackend.cpp.o
lib/libLLVMSparcDesc.a: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcELFObjectWriter.cpp.o
lib/libLLVMSparcDesc.a: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCAsmInfo.cpp.o
lib/libLLVMSparcDesc.a: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCCodeEmitter.cpp.o
lib/libLLVMSparcDesc.a: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCTargetDesc.cpp.o
lib/libLLVMSparcDesc.a: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCExpr.cpp.o
lib/libLLVMSparcDesc.a: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcTargetStreamer.cpp.o
lib/libLLVMSparcDesc.a: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/build.make
lib/libLLVMSparcDesc.a: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/JoeWillsher/developer/swift_llvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking CXX static library ../../../libLLVMSparcDesc.a"
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Sparc/MCTargetDesc && $(CMAKE_COMMAND) -P CMakeFiles/LLVMSparcDesc.dir/cmake_clean_target.cmake
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Sparc/MCTargetDesc && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/LLVMSparcDesc.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/build: lib/libLLVMSparcDesc.a

.PHONY : lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/build

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/requires: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcAsmBackend.cpp.o.requires
lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/requires: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcELFObjectWriter.cpp.o.requires
lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/requires: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCAsmInfo.cpp.o.requires
lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/requires: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCCodeEmitter.cpp.o.requires
lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/requires: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCTargetDesc.cpp.o.requires
lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/requires: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcMCExpr.cpp.o.requires
lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/requires: lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/SparcTargetStreamer.cpp.o.requires

.PHONY : lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/requires

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/clean:
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Sparc/MCTargetDesc && $(CMAKE_COMMAND) -P CMakeFiles/LLVMSparcDesc.dir/cmake_clean.cmake
.PHONY : lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/clean

lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/depend:
	cd /Users/JoeWillsher/developer/swift_llvm/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/JoeWillsher/developer/swift_llvm/llvm /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/Sparc/MCTargetDesc /Users/JoeWillsher/developer/swift_llvm/build /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Sparc/MCTargetDesc /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/Target/Sparc/MCTargetDesc/CMakeFiles/LLVMSparcDesc.dir/depend

