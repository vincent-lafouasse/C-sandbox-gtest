add_executable(IntegersTest)

set(integers_module
	${tested_src_dir}/integers/add.c
)

target_sources(IntegersTest PRIVATE
	${CMAKE_CURRENT_LIST_DIR}/main.cpp
	${CMAKE_CURRENT_LIST_DIR}/addition.cpp

	${integers_module}
)

target_include_directories(IntegersTest PUBLIC
	${tested_include_dir}
)

target_link_libraries(IntegersTest
	libgtest
)
