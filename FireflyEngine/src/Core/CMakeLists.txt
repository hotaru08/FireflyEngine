# CMakeList.txt : CMake project for FireflyEngine - Core folder
#
cmake_minimum_required (VERSION 3.8)

target_sources (FireflyEngine PRIVATE 
    ${CMAKE_CURRENT_LIST_DIR}/Application.h 
    ${CMAKE_CURRENT_LIST_DIR}/Application.cpp
)

# Add source to this project's executable.
# file(GLOB_RECURSE SOURCE_FILES CONFIGURE_DEPENDS *.cpp *.h *.hpp)
