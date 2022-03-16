# Try to find libcerf
# Once done this will define
#  EIGEN_FOUND - System has EIGEN
#  EIGEN_INCLUDE_DIRS - The EIGEN include directories
#  EIGEN_LIBRARIES - The libraries needed to use EIGEN
#  EIGEN_DEFINITIONS - Compiler switches required for using EIGEN

find_path(EIGEN_INCLUDE_DIR Matrix.h HINTS )

find_library(EIGEN_LIBRARY NAMES Eigen eigen3 HINTS)

set(EIGEN_LIBRARIES ${EIGEN_LIBRARY})
set(EIGEN_INCLUDE_DIRS ${EIGEN_INCLUDE_DIR})

include(FindPackageHandleStandardArgs)

# handle the QUIETLY and REQUIRED arguments and set EIGEN_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(
	EIGEN
	DEFAULT_MSG
	EIGEN_LIBRARY
	EIGEN_INCLUDE_DIR
)

mark_as_advanced(EIGEN_INCLUDE_DIR EIGEN_LIBRARY)
