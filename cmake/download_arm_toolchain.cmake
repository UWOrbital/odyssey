set(TOOLCHAIN_DIR ${CMAKE_BINARY_DIR}/toolchain)
set(TOOLCHAIN_TMP_DIR ${CMAKE_BINARY_DIR}/toolchain_tmp)
set(TOOLCHAIN_ZIP_FILE ${CMAKE_BINARY_DIR}/toolchain.tar.gz)

# Depending on the system that the dev is on, you will need a different 
# toolchain
if( MAKE_HOST_SYSTEM_NAME STREQUAL "Windows")
  set(TOOLCHAIN_URL https://gitlab.arm.com/api/v4/projects/tooling%2Fgnu-toolchains-for-arm/packages/generic/gnu-toolchain/15.3.rel1/arm-gnu-toolchain-15.3.rel1-mingw-w64-x86_64-arm-none-eabi.zip)
elseif(CMAKE_HOST_SYSTEM_NAME STREQUAL "Linux")
  if(CMAKE_HOST_SYSTEM_PROCESSOR MATCHES "(x86_64|amd64|AMD64)")
    set(TOOLCHAIN_URL https://gitlab.arm.com/api/v4/projects/tooling%2Fgnu-toolchains-for-arm/packages/generic/gnu-toolchain/15.3.rel1/arm-gnu-toolchain-15.3.rel1-x86_64-arm-none-eabi.tar.xz)
  elseif(CMAKE_HOST_SYSTEM_PROCESSOR MATCHES "(arm64|aarch64|ARM64)")
    set(TOOLCHAIN_URL https://gitlab.arm.com/api/v4/projects/tooling%2Fgnu-toolchains-for-arm/packages/generic/gnu-toolchain/15.3.rel1/arm-gnu-toolchain-15.3.rel1-aarch64-arm-none-eabi.tar.xz)
  endif()
elseif(CMAKE_HOST_SYSTEM_NAME STREQUAL "Darwin")
  set(TOOLCHAIN_URL https://gitlab.arm.com/api/v4/projects/tooling%2Fgnu-toolchains-for-arm/packages/generic/gnu-toolchain/15.3.rel1/arm-gnu-toolchain-15.3.rel1-darwin-arm64-arm-none-eabi.tar.xz)
else()
  message(FATAL_ERROR "Unsupported Machine (Are you running on a microwave?)")
endif()

# Download the file 
file(DOWNLOAD ${TOOLCHAIN_URL} ${TOOLCHAIN_ZIP_FILE} SHOW_PROGRESS)

# Check for download errors
if(NOT EXISTS ${TOOLCHAIN_ZIP_FILE})
    message(FATAL_ERROR "Failed to download toolchain")
endif()

# Extract the toolchain 
execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory "${TOOLCHAIN_TMP_DIR}")

execute_process(COMMAND ${CMAKE_COMMAND} -E tar xzf "${TOOLCHAIN_ZIP_FILE}"
    WORKING_DIRECTORY "${TOOLCHAIN_TMP_DIR}") 

file(GLOB TOOLCHAIN_TMP_DIR_CONTENTS "${TOOLCHAIN_TMP_DIR}/*")
list(GET TOOLCHAIN_TMP_DIR_CONTENTS 0 INNER_DIR_PATH)
file(RENAME ${INNER_DIR_PATH} ${TOOLCHAIN_DIR})

# Remove the temporary directory
execute_process(COMMAND ${CMAKE_COMMAND} -E remove_directory "${TOOLCHAIN_TMP_DIR}")
file(REMOVE "${TOOLCHAIN_ZIP_FILE}")
