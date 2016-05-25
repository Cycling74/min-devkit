cmake_minimum_required(VERSION 3.0)

set(C74_MIN_API_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../min-api)
include(${C74_MIN_API_DIR}/script/min-pretarget.cmake)


#############################################################
# MAX EXTERNAL
#############################################################


include_directories( 
	"${C74_INCLUDES}"
)


add_library( 
	${PROJECT_NAME} 
	MODULE
	${PROJECT_NAME}.cpp
)


include(${C74_MIN_API_DIR}/script/min-posttarget.cmake)


#############################################################
# UNIT TEST
#############################################################

project(test_${PROJECT_NAME})

if (EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_NAME}.cpp")
	enable_testing()

	include_directories( 
		"${C74_MIN_API_DIR}/test/catch/include"
		"${C74_MIN_API_DIR}/test/mock"
	)

	add_executable(${PROJECT_NAME} ${PROJECT_NAME}.cpp)

	set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD 14)
	set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD_REQUIRED ON)

	add_test(NAME ${PROJECT_NAME}
	         COMMAND ${PROJECT_NAME})

	if (APPLE)
		target_link_libraries(${PROJECT_NAME} "-weak_framework JitterAPI")
		set_target_properties(${PROJECT_NAME} PROPERTIES LINK_FLAGS "-Wl,-F${C74_MAX_API_DIR}/lib/mac")
	endif ()
	if (WIN32)
		target_link_libraries(${PROJECT_NAME} ${MaxAPI_LIB})
		target_link_libraries(${PROJECT_NAME} ${MaxAudio_LIB})
		target_link_libraries(${PROJECT_NAME} ${Jitter_LIB})
  	endif ()

endif ()
