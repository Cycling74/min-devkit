# Copyright 2018 The Max-API Authors. All rights reserved.
# Use of this source code is governed by the MIT License found in the License.md file.


# Add a new max external project with given target name. A project and a target with 
# this name is created and prepared to use with the min-devkit. The target is automatically 
# linked against the necessary libraries. 
#
# Call example: 
# c74_add_project(mytarget SOURCES main.cpp asd.cpp)

function(c74_add_project target)
	set(multiValueArgs SOURCES)
	cmake_parse_arguments(PARSE_ARGV 0 PARAMS "${options}" "${oneValueArgs}" "${multiValueArgs}")
	

	if (DEFINED C74_LIBRARY_OUTPUT_DIRECTORY)
		set(OUTPUT_DIRECTORY "${C74_LIBRARY_OUTPUT_DIRECTORY}")
	else()
		if (NOT DEFINED C74_BUILD_MAX_EXTENSION)
			set(OUTPUT_DIRECTORY "${C74_MINDEVKIT_PATH}/externals")
		else ()
			set(OUTPUT_DIRECTORY "${C74_MINDEVKIT_PATH}/extensions")
		endif ()
	endif()
		

	add_definitions(-DC74_USE_MIN_LIB)
	c74_add_min_target(${target} SOURCES ${PARAMS_SOURCES} OUTPUT_DIRECTORY ${OUTPUT_DIRECTORY}) # no quotes!

	set_target_properties(${target} PROPERTIES FOLDER "Projects")

endfunction()
