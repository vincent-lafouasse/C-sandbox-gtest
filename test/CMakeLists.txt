cmake_minimum_required(VERSION 3.10)

project(gtest_sandbox)
set(CMAKE_CXX_STANDARD 17)

#install gtest
include(${CMAKE_SOURCE_DIR}/install_gtest.cmake)

#import library
add_library(mylib STATIC IMPORTED)
set_target_properties(mylib PROPERTIES
  IMPORTED_LOCATION "${CMAKE_SOURCE_DIR}/../libmylib.a"
  INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_SOURCE_DIR}/../include"
)

add_executable(test_runner src/test.cpp)
target_link_libraries(test_runner
    mylib
    libgtest
)

