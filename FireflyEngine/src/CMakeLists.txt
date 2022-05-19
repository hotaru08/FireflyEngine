# CMakeList.txt : CMake project for FireflyEngine

# CMake version
cmake_minimum_required (VERSION 3.8)

set( src_root_path ${CMAKE_CURRENT_SOURCE_DIR})
file(
    GLOB_RECURSE src_list 
    LIST_DIRECTORIES false
    "${src_root_path}/*.c*"
    "${src_root_path}/*.h*"
)

# Set this project as a static library, to be used 
add_library (FireflyEngine STATIC ${src_list})

# for each source file, add to filter and list under that
foreach(_source IN ITEMS ${src_list})
    get_filename_component(_source_path "${_source}" PATH)
    file(RELATIVE_PATH _source_path_rel "${src_root_path}" "${_source_path}")
    string(REPLACE "/" "\\" _group_path "${_source_path_rel}")
    source_group("${_group_path}" FILES "${_source}")
endforeach()

# Include directories for flexible path naming
set (INCL_DIRS PRIVATE 
    Core
    ECS
    pch
)
target_include_directories(FireflyEngine PRIVATE 
    ${INCL_DIRS}
)

# Setup precompiled header
target_precompile_headers(FireflyEngine PRIVATE
    pch.h
)

