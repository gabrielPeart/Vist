# Install script for directory: /Users/JoeWillsher/developer/swift_llvm/llvm/lib/Target

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "LLVMTarget")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/JoeWillsher/developer/swift_llvm/build/lib/libLLVMTarget.a")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libLLVMTarget.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libLLVMTarget.a")
    execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libLLVMTarget.a")
  endif()
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/JoeWillsher/developer/swift_llvm/build/lib/Target/AArch64/cmake_install.cmake")
  include("/Users/JoeWillsher/developer/swift_llvm/build/lib/Target/AMDGPU/cmake_install.cmake")
  include("/Users/JoeWillsher/developer/swift_llvm/build/lib/Target/ARM/cmake_install.cmake")
  include("/Users/JoeWillsher/developer/swift_llvm/build/lib/Target/BPF/cmake_install.cmake")
  include("/Users/JoeWillsher/developer/swift_llvm/build/lib/Target/CppBackend/cmake_install.cmake")
  include("/Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Hexagon/cmake_install.cmake")
  include("/Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Mips/cmake_install.cmake")
  include("/Users/JoeWillsher/developer/swift_llvm/build/lib/Target/MSP430/cmake_install.cmake")
  include("/Users/JoeWillsher/developer/swift_llvm/build/lib/Target/NVPTX/cmake_install.cmake")
  include("/Users/JoeWillsher/developer/swift_llvm/build/lib/Target/PowerPC/cmake_install.cmake")
  include("/Users/JoeWillsher/developer/swift_llvm/build/lib/Target/Sparc/cmake_install.cmake")
  include("/Users/JoeWillsher/developer/swift_llvm/build/lib/Target/SystemZ/cmake_install.cmake")
  include("/Users/JoeWillsher/developer/swift_llvm/build/lib/Target/X86/cmake_install.cmake")
  include("/Users/JoeWillsher/developer/swift_llvm/build/lib/Target/XCore/cmake_install.cmake")

endif()

