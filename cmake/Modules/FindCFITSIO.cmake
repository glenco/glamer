# Try to find CFITSIO
# The path given in a CFITSIO environment variable will be searched first.
# Once done this will define
#  CFITSIO_FOUND - System has CFITSIO
#  CFITSIO_INCLUDE_DIRS - The CFITSIO include directories
#  CFITSIO_LIBRARIES - The libraries needed to use CFITSIO
#  CFITSIO_DEFINITIONS - Compiler switches required for using CFITSIO

INCLUDE( FindPackageHandleStandardArgs )

#set(CFITSIO CACHE FILEPATH "Path to CFITSIO.")

IF( DEFINED ENV{CFITSIO_DIR} )
  SET( CFITSIO "$ENV{CFITSIO_DIR}" )
ENDIF()

FIND_PATH( CFITSIO_INCLUDE_DIR
  fitsio.h
  HINTS ${CFITSIO}
)

FIND_LIBRARY( CFITSIO_LIBRARY
  NAMES cfitsio
  HINTS ${CFITSIO}
)

FIND_PACKAGE_HANDLE_STANDARD_ARGS( CFITSIO DEFAULT_MSG
  CFITSIO_INCLUDE_DIR
  CFITSIO_LIBRARY
)

IF( CFITSIO_FOUND )
  SET( CFITSIO_INCLUDE_DIRS ${CFITSIO_INCLUDE_DIR} )
  SET( CFITSIO_LIBRARIES ${CFITSIO_LIBRARY} )

  MARK_AS_ADVANCED(
    CFITSIO_LIBRARY
    CFITSIO_INCLUDE_DIR
    CFITSIO_DIR
  )
ELSE()
  SET( CFITSIO_DIR "" CACHE STRING
    "An optional hint to a directory for finding `cfitsio`"
  )
ENDIF()

###############################################################

#find_path(CFITSIO_INCLUDE_DIR
#	fitsio.h
#	HINTS ${CFITSIO}
#	PATHS
#	  /usr/local/
#	  /opt/anaconda3/
#	  /opt/anaconda2/
#	PATH_SUFFIXES "include"
#	DOC "CFITSIO include directory"
#)

#set(CFITSIO_INCLUDE_DIRS ${CFITSIO_INCLUDE_DIR})

#find_library(CFITSIO_LIBRARY
#	NAMES cfitsio libcfitsio
#	HINTS ${CFITSIO}
#	PATH_SUFFIXES "lib"
#	DOC "CFITSIO library"
#)

#set(CFITSIO_LIBRARIES ${CFITSIO_LIBRARY})

#include(FindPackageHandleStandardArgs)

# handle the QUIETLY and REQUIRED arguments and set CFITSIO_FOUND to TRUE
# if all listed variables are TRUE
#find_package_handle_standard_args(
#	CFITSIO
#	DEFAULT_MSG
#	CFITSIO_LIBRARY
#	CFITSIO_INCLUDE_DIR
#)

#mark_as_advanced(CFITSIO_INCLUDE_DIR CFITSIO_LIBRARY)
