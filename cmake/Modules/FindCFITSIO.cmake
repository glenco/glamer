# Try to find CFITSIO
# Once done this will define
#  CFITSIO_FOUND - System has CFITSIO
#  CFITSIO_INCLUDE_DIRS - The CFITSIO include directories
#  CFITSIO_LIBRARIES - The libraries needed to use CFITSIO
#  CFITSIO_DEFINITIONS - Compiler switches required for using CFITSIO

find_path(CFITSIO_INCLUDE_DIR fitsio.h HINTS )

find_library(CFITSIO_LIBRARY NAMES cfitsio libcfitsio HINTS)

set(CFITSIO_LIBRARIES ${CFITSIO_LIBRARY})
set(CFITSIO_INCLUDE_DIRS ${CFITSIO_INCLUDE_DIR})

include(FindPackageHandleStandardArgs)

# handle the QUIETLY and REQUIRED arguments and set CFITSIO_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(
	CFITSIO
	DEFAULT_MSG
	CFITSIO_LIBRARY
	CFITSIO_INCLUDE_DIR
)

mark_as_advanced(CFITSIO_INCLUDE_DIR CFITSIO_LIBRARY)
