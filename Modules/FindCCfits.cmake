# Try to find CCfits
# Once done this will define
#  CCFITS_FOUND - System has CCfits
#  CCFITS_INCLUDE_DIRS - The CCfits include directories
#  CCFITS_LIBRARIES - The libraries needed to use CCfits
#  CCFITS_DEFINITIONS - Compiler switches required for using CCfits

find_package(CFITSIO REQUIRED)

find_path(CCFITS_INCLUDE_DIR CCfits/CCfits HINTS )

find_library(CCFITS_LIBRARY NAMES CCfits libCCfits HINTS )

set(CCFITS_LIBRARIES ${CCFITS_LIBRARY} ${CFITSIO_LIBRARIES})
set(CCFITS_INCLUDE_DIRS ${CCFITS_INCLUDE_DIR} ${CFITSIO_INCLUDE_DIRS})

include(FindPackageHandleStandardArgs)

# handle the QUIETLY and REQUIRED arguments and set CCFITS_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(
	CCfits
	DEFAULT_MSG
	CCFITS_LIBRARY
	CCFITS_INCLUDE_DIR
)

mark_as_advanced(CCFITS_INCLUDE_DIR CCFITS_LIBRARY)
