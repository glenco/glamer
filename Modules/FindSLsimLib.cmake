# Try to find SLsimLib
# Once done this will define
#  SLSIMLIB_FOUND - System has SLsimLib
#  SLSIMLIB_INCLUDE_DIRS - The SLsimLib include directories
#  SLSIMLIB_LIBRARIES - The libraries needed to use SLsimLib
#  SLSIMLIB_DEFINITIONS - Compiler switches required for using SLsimLib

find_package(NR REQUIRED)
find_package(CosmoLib REQUIRED)

set(SLSIMLIB_INCLUDE_DIR "${PROJECT_SOURCE_DIR}/../SLsimLib/include" CACHE PATH "Includes for SLsimLib library.")
set(SLSIMLIB_LIBRARY_DIR "${PROJECT_SOURCE_DIR}/../SLsimLib/build" CACHE PATH "Path to the SLsimLib library.")

find_path(SLSIMLIB_INCLUDE_DIR cosmo.h HINTS ${SLSIMLIB_INCLUDE_DIR})

find_library(SLSIMLIB_LIBRARY NAMES SLsimLib libSLsimLib HINTS ${SLSIMLIB_LIBRARY_DIR})

set(SLSIMLIB_LIBRARIES ${SLSIMLIB_LIBRARY} ${NR_LIBRARIES} ${COSMOLIB_LIBRARIES})
set(SLSIMLIB_INCLUDE_DIRS ${SLSIMLIB_INCLUDE_DIR} ${NR_INCLUDE_DIRS} ${COSMOLIB_INCLUDE_DIRS})

include(FindPackageHandleStandardArgs)

# handle the QUIETLY and REQUIRED arguments and set SLSIMLIB_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(
	SLSIMLIB
	DEFAULT_MSG
	SLSIMLIB_INCLUDE_DIR
	SLSIMLIB_LIBRARY
)

mark_as_advanced(SLSIMLIB_INCLUDE_DIR SLSIMLIB_LIBRARY)
