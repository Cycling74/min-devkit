cmake_minimum_required(VERSION 3.19)

include(FetchContent)

# Fetch min-api; SOURCE_DIR keeps it at source/min-api so existing paths keep working.
# Update GIT_TAG once the cmake-improvements changes in min-api are committed.
fetchcontent_declare(
    min-api
    GIT_REPOSITORY https://github.com/Cycling74/min-api.git
    GIT_TAG 56ffba52ffc6a57373a28d2f8f3acbed6d266c50
    SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/source/min-api")
fetchcontent_makeavailable(min-api)

# Fetches max-sdk-base + readerwriterqueue; sets MAXSDK_BASE_DIR and MINAPI_DIR
include(${CMAKE_CURRENT_SOURCE_DIR}/source/min-api/script/min-package.cmake)

# Compatibility variables used by min-object-unittest.cmake
set(C74_MIN_API_DIR "${MINAPI_DIR}")
set(MAX_SDK_INCLUDES "${MAXSDK_BASE_DIR}/c74support/max-includes")
set(MAX_SDK_MSP_INCLUDES "${MAXSDK_BASE_DIR}/c74support/msp-includes")
set(MAX_SDK_JIT_INCLUDES "${MAXSDK_BASE_DIR}/c74support/jit-includes")
set(C74_INCLUDES
    "${MAXSDK_BASE_DIR}/c74support"
    "${MAX_SDK_INCLUDES}"
    "${MAX_SDK_MSP_INCLUDES}"
    "${MAX_SDK_JIT_INCLUDES}"
    "${MINAPI_DIR}/include")

# Hook up min-api's cmake hooks for all subsequent project() calls (per-external subdirs)
set(CMAKE_PROJECT_INCLUDE_BEFORE "${MINAPI_DIR}/cmake/Min/Project/Before.cmake")
set(CMAKE_PROJECT_INCLUDE "${MINAPI_DIR}/cmake/Min/Project/After.cmake")

project(Min-DevKit)

enable_testing()

string(REGEX REPLACE "(.*)/" "" THIS_PACKAGE_NAME "${CMAKE_CURRENT_SOURCE_DIR}")

if(APPLE)
    if(${CMAKE_GENERATOR} MATCHES "Xcode")
        if(${XCODE_VERSION} VERSION_LESS 10)
            message(STATUS "Xcode 10 or higher is required. Please install from the Mac App Store.")
            return()
        elseif(${XCODE_VERSION} VERSION_GREATER_EQUAL 12)
            set(C74_BUILD_FAT YES)
        endif()
    endif()

    if(NOT CMAKE_OSX_ARCHITECTURES)
        if(C74_BUILD_FAT)
            set(CMAKE_OSX_ARCHITECTURES "x86_64;arm64" CACHE STRING "macOS architecture" FORCE)
        else()
            set(CMAKE_OSX_ARCHITECTURES ${CMAKE_SYSTEM_PROCESSOR} CACHE STRING "macOS architecture" FORCE)
        endif()
        message("CMAKE_OSX_ARCHITECTURES set to ${CMAKE_OSX_ARCHITECTURES}")
    endif()
endif()

fetchcontent_declare(
    min-lib
    GIT_REPOSITORY https://github.com/Cycling74/min-lib.git
    GIT_TAG 050ccc10e4587219854242e2e0b42ef8e851bf05
    SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/source/min-lib")
fetchcontent_makeavailable(min-lib)

# Generate a project for every folder in the "source/projects" folder
subdirlist(PROJECT_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/source/projects)
foreach(project_dir ${PROJECT_DIRS})
    if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/source/projects/${project_dir}/CMakeLists.txt")
        message("Generating: ${project_dir}")
        add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/source/projects/${project_dir})
    endif()
endforeach()

# Comment the line below if you want automatic cmake regeneration enabled
set(CMAKE_SUPPRESS_REGENERATION true)
