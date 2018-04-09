# Copyright 2018 The Min-DevKit Authors. All rights reserved.
# Use of this source code is governed by the MIT License found in the License.md file.

cmake_minimum_required(VERSION 3.0)

set(C74_MIN_API_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../min-api)
include(${C74_MIN_API_DIR}/script/min-pretarget.cmake)


#############################################################
# MAX EXTERNAL
#############################################################


include_directories( 
	"${C74_INCLUDES}"
	"hoedown/src"
)


if (WIN32)
	add_definitions(
		-D_CRT_SECURE_NO_WARNINGS
	)
endif ()


set( SOURCE_FILES
	${PROJECT_NAME}.cpp
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


add_library( 
	${PROJECT_NAME} 
	MODULE
	${SOURCE_FILES}
)


include(${C74_MIN_API_DIR}/script/min-posttarget.cmake)


#############################################################
# UNIT TEST
#############################################################

include(${C74_MIN_API_DIR}/test/min-object-unittest.cmake)
