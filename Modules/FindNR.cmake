# Try to find NR
# Once done this will define
#  NR_FOUND - System has NR
#  NR_INCLUDE_DIRS - The NR include directories
#  NR_LIBRARIES - The libraries needed to use NR
#  NR_DEFINITIONS - Compiler switches required for using NR

set(NR_INCLUDE_DIR "${PROJECT_SOURCE_DIR}/../NR/include" CACHE PATH "Includes for NR library.")
set(NR_LIBRARY_DIR "${PROJECT_SOURCE_DIR}/../NR/build" CACHE PATH "Path to the NR library.")

find_path(NR_INCLUDE_DIR nr.h HINTS ${NR_INCLUDE_DIR})

find_library(NR_LIBRARY NAMES NR libNR HINTS ${NR_LIBRARY_DIR})

set(NR_LIBRARIES ${NR_LIBRARY})
set(NR_INCLUDE_DIRS ${NR_INCLUDE_DIR})

include(FindPackageHandleStandardArgs)

# handle the QUIETLY and REQUIRED arguments and set NR_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(
	NR
	DEFAULT_MSG
	NR_INCLUDE_DIR
	NR_LIBRARY
)

mark_as_advanced(NR_INCLUDE_DIR NR_LIBRARY)
