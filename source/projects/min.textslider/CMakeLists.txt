# Copyright 2018 The Min-DevKit Authors. All rights reserved.
# Use of this source code is governed by the MIT License found in the License.md file.

cmake_minimum_required(VERSION 3.19)

if(${CMAKE_CXX_COMPILER_ID} STREQUAL "MSVC")
    string(SUBSTRING ${CMAKE_CXX_COMPILER_VERSION} 0 2 MSVC_VERSION_MAJOR)
    string(SUBSTRING ${CMAKE_CXX_COMPILER_VERSION} 3 1 MSVC_VERSION_MINOR)
    if(${MSVC_VERSION_MAJOR} VERSION_LESS 19 OR ${MSVC_VERSION_MAJOR} MATCHES 19 AND ${MSVC_VERSION_MINOR} VERSION_LESS 1)
        message(STATUS "Visual Studio 17 or greater is required for UI objects.")
        message(STATUS "SKIPPING!")
        return()
    endif()
endif()

set_property(DIRECTORY PROPERTY min::external YES)
project(min.textslider)

include(${C74_MIN_API_DIR}/test/min-object-unittest.cmake)
