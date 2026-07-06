include(FetchContent)

# FreeRTOS time 
# Let's set a variable false to show progress 
set(FETCHCONTENT_QUIET FALSE)

# FetchContent Declare taken from rm46 FreeRTOS Example
FetchContent_Declare(
    freertos_kernel
    GIT_REPOSITORY https://github.com/FreeRTOS/FreeRTOS-Kernel.git
    # NOTE: Change tag to update FreeRTOS
    GIT_TAG V11.3.0
    # NOTE: this is where cmake populates the repo 
    SOURCE_DIR "${CMAKE_SOURCE_DIR}/freertos/extern"
    USES_TERMINAL_DOWNLOAD YES
    USES_TERMINAL_UPDATE   YES
    BUILD_COMMAND ""
    GIT_PROGRESS TRUE
)

# NOTE: This config stays standard across boards
add_library(freertos_config INTERFACE)

target_include_directories(freertos_config SYSTEM
INTERFACE
  ${CMAKE_SOURCE_DIR}/freertos/config
)

# TODO: make both configs depend on configuration for board
# Move to portable directory cmake configurations
set( FREERTOS_HEAP "4" CACHE STRING "" FORCE)

# Select the native compile PORT
set( FREERTOS_PORT "GCC_ARM_CRX_MPU" CACHE STRING "" FORCE)


FetchContent_MakeAvailable(freertos_kernel)

set(FREERTOS_KERNEL_DIR "${CMAKE_SOURCE_DIR}/freertos/extern")

# TODO: Base on board configuration
set(FREERTOS_PORT_DIR "${FREERTOS_KERNEL_DIR}/portable/GCC/ARM_CRx_MPU")

# For debugging
message("FREERTOS_KERNEL_DIR: ${FREERTOS_KERNEL_DIR}")
message("FREERTOS_PORT_DIR: ${FREERTOS_PORT_DIR}")
