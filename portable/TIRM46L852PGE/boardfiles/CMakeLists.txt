set(RM46_HAL_SOURCES
  ${CMAKE_CURRENT_SOURCE_DIR}/source/dabort.s
  ${CMAKE_CURRENT_SOURCE_DIR}/source/errata_SSWF021_45.c
  ${CMAKE_CURRENT_SOURCE_DIR}/source/esm.c
  ${CMAKE_CURRENT_SOURCE_DIR}/source/gio.c
  ${CMAKE_CURRENT_SOURCE_DIR}/source/notification.c
  ${CMAKE_CURRENT_SOURCE_DIR}/source/pinmux.c
  ${CMAKE_CURRENT_SOURCE_DIR}/source/sys_core.s
  ${CMAKE_CURRENT_SOURCE_DIR}/source/sys_dma.c
  ${CMAKE_CURRENT_SOURCE_DIR}/source/sys_mpu.s
  ${CMAKE_CURRENT_SOURCE_DIR}/source/sys_pcr.c
  ${CMAKE_CURRENT_SOURCE_DIR}/source/sys_phantom.c
  ${CMAKE_CURRENT_SOURCE_DIR}/source/sys_pmm.c
  ${CMAKE_CURRENT_SOURCE_DIR}/source/sys_pmu.s
  ${CMAKE_CURRENT_SOURCE_DIR}/source/sys_vim.c
  ${CMAKE_CURRENT_SOURCE_DIR}/source/system.c
)

set(RM46_HAL_INCLUDE_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/include)

add_library(tirm46 STATIC)
target_include_directories(tirm46 PUBLIC ${RM46_HAL_INCLUDE_DIRS})
target_sources(tirm46 PUBLIC ${RM46_HAL_SOURCES})
