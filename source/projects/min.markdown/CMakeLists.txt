# Copyright 2018 The Min-DevKit Authors. All rights reserved.
# Use of this source code is governed by the MIT License found in the License.md file.

cmake_minimum_required(VERSION 3.19)

set_property(DIRECTORY PROPERTY min::external YES)
set_property(DIRECTORY PROPERTY max::sources
    "min.markdown.cpp"
    "hoedown/src/autolink.c"
    "hoedown/src/buffer.c"
    "hoedown/src/document.c"
    "hoedown/src/escape.c"
    "hoedown/src/html.c"
    "hoedown/src/html_blocks.c"
    "hoedown/src/html_smartypants.c"
    "hoedown/src/stack.c"
    "hoedown/src/version.c"
)

project(min.markdown)

target_include_directories(min.markdown PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/hoedown/src")

if(WIN32)
    target_compile_definitions(min.markdown PRIVATE _CRT_SECURE_NO_WARNINGS)
endif()

include(${C74_MIN_API_DIR}/test/min-object-unittest.cmake)
