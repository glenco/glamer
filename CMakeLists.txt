cmake_minimum_required(VERSION 3.0)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

####
# project settings
####

#set(CMAKE_C_COMPILER "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc")
#set(CMAKE_CXX_COMPILER "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++")

project(GLAMER)

set(GLAMER_VERSION_MAJOR 0)
set(GLAMER_VERSION_MINOR 3)

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
	find_package(CFITSIO REQUIRED)
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

if(ENABLE_CERF)
	find_package(CERF REQUIRED)
endif()

if(ENABLE_EIGEN)
	find_package (Eigen3 3.3 REQUIRED NO_MODULE)
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

set(GLAMER_DEFINITIONS)

if(ENABLE_FITS)
	list(APPEND GLAMER_INCLUDE_DIRS ${CFITSIO_INCLUDE_DIRS})
	list(APPEND GLAMER_LIBRARIES ${CFITSIO_LIBRARIES})
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

if(ENABLE_CERF)
        list(APPEND GLAMER_INCLUDE_DIRS ${CERF_INCLUDE_DIRS})
        list(APPEND GLAMER_LIBRARIES ${CERF_LIBRARIES})
        list(APPEND GLAMER_DEFINITIONS ${CERF_DEFINITIONS})
endif()

if(ENABLE_EIGEN)
        list(APPEND GLAMER_INCLUDE_DIRS ${EIGEN_INCLUDE_DIRS})
        list(APPEND GLAMER_LIBRARIES ${EIGEN_LIBRARIES})
        list(APPEND GLAMER_DEFINITIONS ${EIGEN_DEFINITIONS})
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

