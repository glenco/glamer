# Try to find CosmoLib
# Once done this will define
#  COSMOLIB_FOUND - System has CosmoLib
#  COSMOLIB_INCLUDE_DIRS - The CosmoLib include directories
#  COSMOLIB_LIBRARIES - The libraries needed to use CosmoLib
#  COSMOLIB_DEFINITIONS - Compiler switches required for using CosmoLib

find_package(NR REQUIRED)

set(COSMOLIB_INCLUDE_DIR "${PROJECT_SOURCE_DIR}/../CosmoLib/include" CACHE PATH "Includes for CosmoLib library.")
set(COSMOLIB_LIBRARY_DIR "${PROJECT_SOURCE_DIR}/../CosmoLib/build" CACHE PATH "Path to the CosmoLib library.")

find_path(COSMOLIB_INCLUDE_DIR cosmo.h HINTS ${COSMOLIB_INCLUDE_DIR})

find_library(COSMOLIB_LIBRARY NAMES CosmoLib libCosmoLib HINTS ${COSMOLIB_LIBRARY_DIR})

set(COSMOLIB_LIBRARIES ${COSMOLIB_LIBRARY} ${NR_LIBRARIES})
set(COSMOLIB_INCLUDE_DIRS ${COSMOLIB_INCLUDE_DIR} ${NR_INCLUDE_DIRS})

include(FindPackageHandleStandardArgs)

# handle the QUIETLY and REQUIRED arguments and set COSMOLIB_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(
	CosmoLib
	DEFAULT_MSG
	COSMOLIB_INCLUDE_DIR
	COSMOLIB_LIBRARY
)

mark_as_advanced(COSMOLIB_INCLUDE_DIR COSMOLIB_LIBRARY)
