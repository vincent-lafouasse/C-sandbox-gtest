cmake_minimum_required(VERSION 3.10)

project(gtest_sandbox
	LANGUAGES C CXX
)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE) # LSP stuff, don't worry about it

# fetch gtest
# target: `libgtest` (static library)
include(${CMAKE_SOURCE_DIR}/fetch_gtest.cmake)

set(tested_src_dir ${CMAKE_CURRENT_SOURCE_DIR}/../src/)
set(tested_include_dir ${tested_src_dir}/)

add_subdirectory(Integers)

include(CTest)
enable_testing()

add_test(NAME IntegersTest
		 COMMAND IntegersTest)
