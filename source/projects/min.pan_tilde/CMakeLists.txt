# Copyright 2018 The Min-DevKit Authors. All rights reserved.
# Use of this source code is governed by the MIT License found in the License.md file.

cmake_minimum_required(VERSION 3.19)

set_property(DIRECTORY PROPERTY min::external YES)
set_property(DIRECTORY PROPERTY max::sources
    "min.pan_tilde.cpp"
    "${CMAKE_CURRENT_SOURCE_DIR}/../shared/signal_routing_objects.cpp"
    "${CMAKE_CURRENT_SOURCE_DIR}/../shared/signal_routing_objects.h"
)
project(min.pan_tilde)

target_include_directories(min.pan_tilde PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../shared/")

include(${C74_MIN_API_DIR}/test/min-object-unittest.cmake)
