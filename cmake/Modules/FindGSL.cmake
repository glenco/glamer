# Try to find GSL
# The path given in a GSL environment variable will be searched first.
# Once done this will define
#  GSL_FOUND - System has GSL
#  GSL_INCLUDE_DIRS - The GSL include directories
#  GSL_LIBRARIES - The libraries needed to use GSL
#  GSL_DEFINITIONS - Compiler switches required for using GSL

set(GSL CACHE FILEPATH "Path to GSL.")

find_path(GSL_INCLUDE_DIR
	NAMES gsl/gsl_sys.h gsl/gsl_math.h
	HINTS ${GSL}
	PATH_SUFFIXES "include"
	DOC "GSL include directory"
)

find_library(GSL_LIBRARY
	NAMES gsl libgsl
	HINTS ${GSL}
	PATH_SUFFIXES "lib"
	DOC "GSL library"
)

find_library(GSLCBLAS_LIBRARY
	NAMES gslcblas libgscblas
	HINTS ${GSL}
	PATH_SUFFIXES "lib"
	DOC "GSL CBLAS library"
)

set(GSL_LIBRARIES ${GSL_LIBRARY} ${GSLCBLAS_LIBRARY})
set(GSL_INCLUDE_DIRS ${GSL_INCLUDE_DIR})

include(FindPackageHandleStandardArgs)

# handle the QUIETLY and REQUIRED arguments and set GSL_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(
	GSL
	DEFAULT_MSG
	GSL_LIBRARY
	GSL_INCLUDE_DIR
)

mark_as_advanced(GSL_INCLUDE_DIR GSL_LIBRARY GSLCBLAS_LIBRARY)

