# Try to find HEALPIX
# The path given in a HEALPIX environment variable will be searched first.
# Once done this will define
#  HEALPIX_FOUND - System has HEALPIX
#  HEALPIX_INCLUDE_DIRS - The HEALPIX include directories
#  HEALPIX_LIBRARIES - The libraries needed to use HEALPIX
#  HEALPIX_DEFINITIONS - Compiler switches required for using HEALPIX

set(HEALPIX CACHE FILEPATH "Path to HEALPIX.")

find_path(HEALPIX_INCLUDE_DIR
	NAMES healpix_base.h Healpix_cxx
	HINTS ${HEALPIX}
	PATH_SUFFIXES "include"
	DOC "HEALPIX include directory"
)

find_library(HEALPIX_LIBRARY
	NAMES libhealpix_cxx.a
	HINTS ${HEALPIX}
	PATH_SUFFIXES "lib"
	DOC "HEALPIX library"
)

set(HEALPIX_LIBRARIES ${HEALPIX_LIBRARY} )
set(HEALPIX_INCLUDE_DIRS ${HEALPIX_INCLUDE_DIR})

include(FindPackageHandleStandardArgs)

# handle the QUIETLY and REQUIRED arguments and set HEALPIX_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(
	HEALPIX
	DEFAULT_MSG
	HEALPIX_LIBRARY
	HEALPIX_INCLUDE_DIR
)

mark_as_advanced(HEALPIX_INCLUDE_DIR HEALPIX_LIBRARY )

