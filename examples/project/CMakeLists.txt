cmake_minimum_required(VERSION 2.8)

####
# project settings
####

project(sample)

set(sample_VERSION_MAJOR 1)
set(sample_VERSION_MINOR 0)


####
# headers
####

set(HEADERS
)


####
# sources
####

set(SOURCES
	main.cpp
)


####
# dependencies
####

find_package(GLAMER NO_MODULE REQUIRED)

include_directories(${GLAMER_INCLUDE_DIRS})


####
# build
####

add_executable(sample ${HEADERS} ${SOURCES})

target_link_libraries(sample ${GLAMER_LIBRARIES})


