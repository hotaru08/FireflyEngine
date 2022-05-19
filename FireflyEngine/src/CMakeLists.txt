# CMakeList.txt : CMake project for FireflyEngine

# Marco to enumarate through sub directories in this folder
macro(SUBDIRLIST result curdir)
  FILE(GLOB children RELATIVE ${curdir} ${curdir}/*)
  SET(dirlist "")
  FOREACH(child ${children})
    IF(IS_DIRECTORY ${curdir}/${child})
        SET(dirlist ${dirlist} ${child})
    ENDIF()
  ENDFOREACH()
  SET(${result} ${dirlist})
endmacro()

function(assign_source_group)
    
endfunction(assign_source_group)

# ------------------------------------------------------------------------------

# Definitions
SUBDIRLIST(SUBDIRS ${CMAKE_CURRENT_SOURCE_DIR})

# CMake version
cmake_minimum_required (VERSION 3.8)

# Set source list, and add filters to get source files tree structure layout
set (src_list
    "FE_EntryPoint.cpp"
    "Core/Application.h"
    "Core/Application.cpp"
    "ECS/ECSManager.h"
)

# Set this project as a static library, to be used 
add_library (FireflyEngine STATIC ${src_list})

foreach(_source IN ITEMS ${ARGN})
    
    if (IS_ABSOLUTE "${_source}")
        file(GLOB_RECURSE src_list RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "*.cpp" "*.hpp")
    else()
        set(_source_rel "${_source}")
    endif()
        
    get_filename_component(_source_path "${_source_rel}" PATH)
    string(REPLACE "/" "\\" _source_path_msvc "${_source_path}")
    source_group("${_source_path_msvc}" FILES "${_source}")

endforeach()

# Include directories for flexible path naming
set (INCL_DIRS PRIVATE 
    Core
    ECS
)
target_include_directories(FireflyEngine PRIVATE 
    ${INCL_DIRS}
)


