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

# Utility rule file for install-LLVMNVPTXDesc.

# Include the progress variables for this target.
include lib/Target/NVPTX/MCTargetDesc/CMakeFiles/install-LLVMNVPTXDesc.dir/progress.make

lib/Target/NVPTX/MCTargetDesc/CMakeFiles/install-LLVMNVPTXDesc: lib/libLLVMNVPTXDesc.a
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/NVPTX/MCTargetDesc && /Applications/CMake.app/Contents/bin/cmake -DCMAKE_INSTALL_COMPONENT=LLVMNVPTXDesc -P /Users/JoeWillsher/developer/swift_llvm/build/cmake_install.cmake

install-LLVMNVPTXDesc: lib/Target/NVPTX/MCTargetDesc/CMakeFiles/install-LLVMNVPTXDesc
install-LLVMNVPTXDesc: lib/Target/NVPTX/MCTargetDesc/CMakeFiles/install-LLVMNVPTXDesc.dir/build.make

.PHONY : install-LLVMNVPTXDesc

# Rule to build all files generated by this target.
lib/Target/NVPTX/MCTargetDesc/CMakeFiles/install-LLVMNVPTXDesc.dir/build: install-LLVMNVPTXDesc

.PHONY : lib/Target/NVPTX/MCTargetDesc/CMakeFiles/install-LLVMNVPTXDesc.dir/build

lib/Target/NVPTX/MCTargetDesc/CMakeFiles/install-LLVMNVPTXDesc.dir/clean:
	cd /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/NVPTX/MCTargetDesc && $(CMAKE_COMMAND) -P CMakeFiles/install-LLVMNVPTXDesc.dir/cmake_clean.cmake
.PHONY : lib/Target/NVPTX/MCTargetDesc/CMakeFiles/install-LLVMNVPTXDesc.dir/clean

lib/Target/NVPTX/MCTargetDesc/CMakeFiles/install-LLVMNVPTXDesc.dir/depend:
	cd /Users/JoeWillsher/developer/swift_llvm/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/JoeWillsher/developer/swift_llvm/llvm /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target/NVPTX/MCTargetDesc /Users/JoeWillsher/developer/swift_llvm/build /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/NVPTX/MCTargetDesc /Users/JoeWillsher/developer/swift_llvm/build/lib/Target/NVPTX/MCTargetDesc/CMakeFiles/install-LLVMNVPTXDesc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/Target/NVPTX/MCTargetDesc/CMakeFiles/install-LLVMNVPTXDesc.dir/depend

