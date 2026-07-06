add_subdirectory(boardfiles)
set(RM46_SRCS 
  ${CMAKE_CURRENT_SOURCE_DIR}/src/main.c
)

set(RM46_INCS ${CMAKE_CURRENT_SOURCE_DIR}/inc)

target_include_directories(tirm46 PUBLIC ${RM46_INCS})
target_sources(tirm46 PUBLIC ${RM46_SRCS})

