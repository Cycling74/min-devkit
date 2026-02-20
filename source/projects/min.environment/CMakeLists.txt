# Copyright 2018 The Min-DevKit Authors. All rights reserved.
# Use of this source code is governed by the MIT License found in the License.md file.

cmake_minimum_required(VERSION 3.19)

# Platform-specific source files — use max::sources to avoid globbing both
if(APPLE)
    set_property(DIRECTORY PROPERTY max::sources
        min.environment.cpp
        min.environment.mac.cpp)
else()
    set_property(DIRECTORY PROPERTY max::sources
        min.environment.cpp
        min.environment.windows.cpp)
endif()

set_property(DIRECTORY PROPERTY min::external YES)
project(min.environment)

if(APPLE)
    find_library(CARBON_LIBRARY "Carbon")
    target_link_libraries(${PROJECT_NAME} PUBLIC ${CARBON_LIBRARY})
    find_library(IOKIT_LIBRARY "IOKit")
    target_link_libraries(${PROJECT_NAME} PUBLIC ${IOKIT_LIBRARY})
else()
    target_link_libraries(${PROJECT_NAME} PUBLIC IPHLPAPI.lib)
endif()

include(${C74_MIN_API_DIR}/test/min-object-unittest.cmake)
