# CMakeList.txt : CMake project for FireflyEngine
#

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

# Definitions
SUBDIRLIST(SUBDIRS ${CMAKE_CURRENT_SOURCE_DIR})

# CMake version
cmake_minimum_required (VERSION 3.8)

# Add sub directories containing other files
# Set this project as a static library, to be used 
add_library (FireflyEngine STATIC FE_EntryPoint.cpp)

FOREACH(subdir ${SUBDIRS})
    add_subdirectory (${subdir})
ENDFOREACH()

# Create the source groups for source tree with root at CMAKE_CURRENT_SOURCE_DIR.
source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${MyProj_SOURCES})

# Add files in this folder to project
file(GLOB_RECURSE SOURCE_FILES CONFIGURE_DEPENDS *.cpp *.h)

# Include directories for flexible path naming
set (INCL_DIRS PRIVATE 
    Core
    ECS
)
target_include_directories(FireflyEngine PRIVATE 
    ${INCL_DIRS}
)
