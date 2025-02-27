cmake_minimum_required(VERSION 3.19)
project(Min-DevKit)


option(C74_BUILD_PROVIDED_PROJECTS "Build the provided projects" ON)
option(C74_SORT_INTO_FOLDERS "Sort projects and targets into folders (in the IDE)" OFF)
option(C74_SURPRESS_AUTOMATIC_CMAKE_REGENERATION "Prevent IDE automatically running CMake when a file has changed" ON)

set(C74_MINDEVKIT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
set(C74_DEFAULT_PROJECT_CXX_STANDARD 17) # all projects added with c74_add_project() are set to this C++ version by default. 

set_property(GLOBAL PROPERTY USE_FOLDERS ${C74_SORT_INTO_FOLDERS})
set(CMAKE_SUPPRESS_REGENERATION ${C74_AUTOMATIC_CMAKE_REGENERATION})


include(script/c74_add_project.cmake)

enable_testing()

string(REGEX REPLACE "(.*)/" "" THIS_PACKAGE_NAME "${CMAKE_CURRENT_SOURCE_DIR}")

if (APPLE)
    if (${CMAKE_GENERATOR} MATCHES "Xcode")
            if (${XCODE_VERSION} VERSION_LESS 10)
                message(STATUS "Xcode 10 or higher is required. Please install from the Mac App Store.")
                return ()
            elseif(${XCODE_VERSION} VERSION_GREATER_EQUAL 12)
                set(C74_BUILD_FAT YES)
            endif ()
    endif ()

    if (NOT CMAKE_OSX_ARCHITECTURES)
        if(C74_BUILD_FAT)
            set(CMAKE_OSX_ARCHITECTURES "x86_64;arm64" CACHE STRING "macOS architecture" FORCE)
        else()
            set(CMAKE_OSX_ARCHITECTURES ${CMAKE_SYSTEM_PROCESSOR} CACHE STRING "macOS architecture" FORCE)
        endif()
        message("CMAKE_OSX_ARCHITECTURES set to ${CMAKE_OSX_ARCHITECTURES}")
    endif()
endif()


# Misc setup and subroutines
include(${CMAKE_CURRENT_SOURCE_DIR}/source/min-api/script/min-package.cmake)


# Add the min-api, if it exists
if (EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/source/min-api/CMakeLists.txt")
    add_subdirectory(source/min-api)
else()
    message(FATAL_ERROR "The min-api repository is missing. Maybe you did not clone recursively?")
endif ()
# Add the min-lib, if it exists
if (EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/source/min-lib/CMakeLists.txt")
    add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/source/min-lib)
else()
    message(FATAL_ERROR "The min-lib repository is missing. Maybe you did not clone recursively?")
endif ()

if (C74_BUILD_PROVIDED_PROJECTS)
    # Generate a project for every folder in the "source/projects" folder
    SUBDIRLIST(PROJECT_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/source/projects)
    foreach (project_dir ${PROJECT_DIRS})
            if (EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/source/projects/${project_dir}/CMakeLists.txt")
                message("Generating: ${project_dir}")
                add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/source/projects/${project_dir})
                set_target_properties(${project_dir} PROPERTIES FOLDER "Projects")
            endif ()
    endforeach ()
endif ()
