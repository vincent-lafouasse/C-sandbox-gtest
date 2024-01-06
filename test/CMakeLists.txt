cmake_minimum_required(VERSION 3.10)

project(gtest_sandbox)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE) # LSP stuff, don't worry about it

# fetch gtest
# targets: `libgtest` `libgmock` (static libraries)
include(${CMAKE_SOURCE_DIR}/fetch_gtest.cmake)

#import library
add_library(mylib STATIC IMPORTED)
set_target_properties(mylib PROPERTIES
  IMPORTED_LOCATION "${CMAKE_SOURCE_DIR}/../libmylib.a"
  INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_SOURCE_DIR}/../include"
)

add_executable(test_runner
	src/test.cpp
	src/main.cpp
)
target_link_libraries(test_runner
    mylib
    libgtest
)

