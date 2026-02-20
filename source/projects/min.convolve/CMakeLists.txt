# Copyright 2018 The Min-DevKit Authors. All rights reserved.
# Use of this source code is governed by the MIT License found in the License.md file.

cmake_minimum_required(VERSION 3.19)

set_property(DIRECTORY PROPERTY min::external YES)
project(min.convolve)

include(${C74_MIN_API_DIR}/test/min-object-unittest.cmake)
