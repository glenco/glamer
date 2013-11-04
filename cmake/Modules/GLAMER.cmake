####
# compiler settings
####

option(USE_CXX11 "Use C++11 for compiling (if supported)." ON)

if(USE_CXX11)
	if(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
		if(CMAKE_GENERATOR STREQUAL "Xcode")
			# Xcode settings
			set(CMAKE_XCODE_ATTRIBUTE_GCC_C_LANGUAGE_STANDARD "c99")
			set(CMAKE_XCODE_ATTRIBUTE_CLANG_CXX_LANGUAGE_STANDARD "c++0x")
			set(CMAKE_XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
			message(STATUS "Using C++11 in Xcode settings.")
		else()
			# raw clang++ flags
			set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -stdlib=libc++")
			message(STATUS "Using C++11 in clang++ flags.")
		endif()
	elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
		if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS 4.7)
			set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
			message(STATUS "Using C++0x in g++ flags.")
		else()
			set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
			message(STATUS "Using C++11 in g++ flags.")
		endif()
	elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC10")
		message(STATUS "Using C++11 in MSVC10 by default.")
	else()
		message(STATUS "Not using C++11, unsupported compiler (${CMAKE_CXX_COMPILER_ID}).")
	endif()
endif()


####
# options
####

# FITS
option(ENABLE_FITS "Enable FITS support." ON)

if(ENABLE_FITS)
	find_package(CCfits REQUIRED)
	add_definitions(-DENABLE_FITS=1)
	message(STATUS "FITS support: enabled")
else()
	message(STATUS "FITS support: disabled")
endif()

# FFTW
option(ENABLE_FFTW "Enable functions that require FFTW." ON)

if(ENABLE_FFTW)
	find_package(FFTW3 REQUIRED)
	add_definitions(-DENABLE_FFTW=1)
	message(STATUS "FFTW support: enabled")
else()
	message(STATUS "FFTW support: disabled")
endif()

