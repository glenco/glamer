cmake_minimum_required(VERSION 2.8.10)

####
# project settings
####

project(GLAMER)

set(GLAMER_VERSION_MAJOR 0)
set(GLAMER_VERSION_MINOR 1)

set(GLAMER_VERSION ${GLAMER_VERSION_MAJOR}.${GLAMER_VERSION_MINOR})
#set (CMAKE_CXX_STANDARD 11)

####
# module settings
####

set(GLAMER_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/Modules")

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${GLAMER_MODULE_PATH}")

include(GLAMER)


####
# dependencies
####

find_package(Threads)

if(ENABLE_FITS)
	find_package(CCfits REQUIRED)
endif()

if(ENABLE_FFTW)
	find_package(FFTW3 REQUIRED)
endif()

if(ENABLE_GSL)
	find_package(GSL REQUIRED)
endif()

if(ENABLE_HEALPIX)
	find_package(HEALPIX REQUIRED)
endif()

if(ENABLE_HDF5)
	find_package(HDF5 REQUIRED)
endif()


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

set(GLAMER_LIBRARIES SLsimLib CosmoLib NR ${CMAKE_THREAD_LIBS_INIT})

set(GLAMER_DEFINITIONS )

if(ENABLE_FITS)
	list(APPEND GLAMER_INCLUDE_DIRS ${CCFITS_INCLUDE_DIRS})
	list(APPEND GLAMER_LIBRARIES ${CCFITS_LIBRARIES})
endif()

if(ENABLE_FFTW)
	list(APPEND GLAMER_INCLUDE_DIRS ${FFTW3_INCLUDE_DIRS})
	list(APPEND GLAMER_LIBRARIES ${FFTW3_LIBRARIES})
endif()

if(ENABLE_GSL)
	list(APPEND GLAMER_INCLUDE_DIRS ${GSL_INCLUDE_DIRS})
	list(APPEND GLAMER_LIBRARIES ${GSL_LIBRARIES})
endif()

if(ENABLE_HEALPIX)
	list(APPEND GLAMER_INCLUDE_DIRS ${HEALPIX_INCLUDE_DIRS})
	list(APPEND GLAMER_LIBRARIES ${HEALPIX_LIBRARIES})
endif()

if(ENABLE_HDF5)
	list(APPEND GLAMER_INCLUDE_DIRS ${HDF5_INCLUDE_DIRS})
	list(APPEND GLAMER_LIBRARIES ${HDF5_LIBRARIES})
	list(APPEND GLAMER_DEFINITIONS ${HDF5_DEFINITIONS})
endif()

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

