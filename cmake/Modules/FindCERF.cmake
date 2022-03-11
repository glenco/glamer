# Try to find libcerf
# Once done this will define
#  CERF_FOUND - System has CERF
#  CERF_INCLUDE_DIRS - The CERF include directories
#  CERF_LIBRARIES - The libraries needed to use CERF
#  CERF_DEFINITIONS - Compiler switches required for using CERF

find_path(CERF_INCLUDE_DIR cerf.h HINTS )

find_library(CERF_LIBRARY NAMES cerf libcerf HINTS)

set(CERF_LIBRARIES ${CERF_LIBRARY})
set(CERF_INCLUDE_DIRS ${CERF_INCLUDE_DIR})

include(FindPackageHandleStandardArgs)

# handle the QUIETLY and REQUIRED arguments and set CERF_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(
	CERF
	DEFAULT_MSG
	CERF_LIBRARY
	CERF_INCLUDE_DIR
)

mark_as_advanced(CERF_INCLUDE_DIR CERF_LIBRARY)
