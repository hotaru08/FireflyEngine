# CMakeList.txt : Top-level CMake project file, do global configuration
# and include sub-projects here.
#
cmake_minimum_required (VERSION 3.8)
project ("FireflyProject" VERSION 0.0.1)
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

# Set C++ language to be C++20
if (MSVC AND CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 19.29.30129 AND CMAKE_VERSION VERSION_GREATER 3.20.3)
    # this change happened in CMake 3.20.4
    set(CMAKE_CXX_STANDARD 23) # /std:c++latest - unlocks the non stable cpp20 features. For new 16.11 versions
else ()
    set(CMAKE_CXX_STANDARD 20) # /std:c++latest for msvc and -std=c++20 for everyone else.
endif ()

# ----- Include sub-projects - Firefly Engine
add_subdirectory ("FireflyEngine")
set_target_properties(FireflyEngine PROPERTIES 
    FOLDER "Projects"
    VERSION ${PROJECT_VERSION}
    ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/build/out/FireflyEngine/lib
    LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/build/out/FireflyEngine/lib
    RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/build/out/FireflyEngine/bin
)
target_compile_options(FireflyEngine PRIVATE
  $<$<CXX_COMPILER_ID:MSVC>:/W4>
  $<$<NOT:$<CXX_COMPILER_ID:MSVC>>:-Wall -Wextra -Wpedantic>
)

# Include source files from external dependancies to Firefly Engine

# ----- Include sub-projects - Firefly Editor
add_subdirectory ("FireflyEditor")
set_target_properties(FireflyEditor PROPERTIES 
    FOLDER "Projects"
    VERSION ${PROJECT_VERSION}
    ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/build/out/FireflyEditor/bin
    LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/build/out/FireflyEditor/bin-int
    RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/build/out/FireflyEditor/bin
)
target_compile_options(FireflyEditor PRIVATE
  $<$<CXX_COMPILER_ID:MSVC>:/W4>
  $<$<NOT:$<CXX_COMPILER_ID:MSVC>>:-Wall -Wextra -Wpedantic>
)

# Include source files from external dependancies to Firefly Engine


# Set Startup Project
set(STARTUP_PROJECT "FireflyEditor")
set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ${STARTUP_PROJECT})