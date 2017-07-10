cmake_minimum_required(VERSION 3.0)


set ( MSVC_COMPILER_NAME "MSVC" )
if (${CMAKE_CXX_COMPILER_ID} STREQUAL ${MSVC_COMPILER_NAME})
	string (SUBSTRING ${CMAKE_CXX_COMPILER_VERSION} 0 4 MSVC_VERSION_SHORT)
	string (SUBSTRING ${CMAKE_CXX_COMPILER_VERSION} 0 2 MSVC_VERSION_MAJOR)
	string (SUBSTRING ${CMAKE_CXX_COMPILER_VERSION} 3 1 MSVC_VERSION_MINOR)

	if (${MSVC_VERSION_MAJOR} VERSION_LESS 19 OR ${MSVC_VERSION_MAJOR} MATCHES 19 AND ${MSVC_VERSION_MINOR} VERSION_LESS 1)
  		message(STATUS "Visual Studio ${MSVC_VERSION_SHORT} detected. Visual Studio 17 (19.1) or greater is required for UI objects.")
  		message(STATUS "SKIPPING!")
  		return ()
	endif ()
endif ()


set(C74_MIN_API_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../min-api)
include(${C74_MIN_API_DIR}/script/min-pretarget.cmake)


#############################################################
# MAX EXTERNAL
#############################################################


include_directories( 
	"${C74_INCLUDES}"
)


set( SOURCE_FILES
	${PROJECT_NAME}.cpp
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
