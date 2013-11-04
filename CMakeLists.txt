cmake_minimum_required(VERSION 2.8.10)

####
# project settings
####

project(GLAMER)

set(GLAMER_VERSION_MAJOR 0)
set(GLAMER_VERSION_MINOR 1)

set(GLAMER_VERSION ${GLAMER_VERSION_MAJOR}.${GLAMER_VERSION_MINOR})


####
# module settings
####

set(GLAMER_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/Modules")

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${GLAMER_MODULE_PATH}")

include(GLAMER)


####
# sources
####

add_subdirectory(NR)
add_subdirectory(CosmoLib)
add_subdirectory(SLsimLib)


####
# package
####

include(CMakePackageConfigHelpers)

export(TARGETS NR CosmoLib SLsimLib FILE GLAMERTargets.cmake)

export(PACKAGE GLAMER)

set(GLAMER_INCLUDE_DIRS
	"${NR_SOURCE_DIR}/include"
	"${CosmoLib_SOURCE_DIR}/include"
	"${SLsimLib_SOURCE_DIR}/include"
)

write_basic_package_version_file(
	GLAMERConfigVersion.cmake
	VERSION ${GLAMER_VERSION}
	COMPATIBILITY AnyNewerVersion
)

configure_file(
	GLAMERConfig.cmake.in
	GLAMERConfig.cmake
	@ONLY
)

