# CMakeList.txt : CMake project for FireflyEditor root folder
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
add_executable (FireflyEditor FEditor_Main.cpp)

FOREACH(subdir ${SUBDIRS})
    add_subdirectory (${subdir})
ENDFOREACH()

set (MyProj_SOURCES )
# Create the source groups for source tree with root at CMAKE_CURRENT_SOURCE_DIR.
source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${MyProj_SOURCES})
