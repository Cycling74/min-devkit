cmake_minimum_required(VERSION 3.0)

# Fetch the correct verion of the min-api
message(STATUS "Updating Git Submodules")
execute_process(
	COMMAND				git submodule update --init --recursive
	WORKING_DIRECTORY	"${CMAKE_CURRENT_SOURCE_DIR}"
)


# Misc setup and subroutines
include(${CMAKE_CURRENT_SOURCE_DIR}/source/min-api/script/min-package.cmake)


# Add unit tests for the API
enable_testing()
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/source/min-api)


# Generate a project for every folder in the "source/projects" folder
SUBDIRLIST(PROJECT_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/source/projects)
foreach (project_dir ${PROJECT_DIRS})
	if (EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/source/projects/${project_dir}/CMakeLists.txt")
		message("Generating: ${project_dir}")
		add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/source/projects/${project_dir})
	endif ()
endforeach ()
