cmake_minimum_required(VERSION 3.5)

project(
  Odyssey
  VERSION 0.1
  DESCRIPTION "An open source satellite controller"
  LANGUAGES C CXX ASM
)

if(NOT EXISTS ${CMAKE_BINARY_DIR}/toolchain)
  include(${CMAKE_SOURCE_DIR}/cmake/download_arm_toolchain.cmake)
endif()

# Setting a file to declare a custom toolchain (in this case arm-eabi-none)
set(CMAKE_TOOLCHAIN_FILE ${CMAKE_SOURCE_DIR}/cmake/toolchain_arm_none_eabi.cmake)
set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
enable_language(C CXX ASM)

# Adding FreeRTOS
add_subdirectory(freertos)
add_subdirectory(portable)
