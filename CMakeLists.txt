cmake_minimum_required(VERSION 2.8)

####
# project settings
####

project(GLAMER)

set(GLAMER_VERSION_MAJOR 0)
set(GLAMER_VERSION_MINOR 1)


####
# module settings
####

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${PROJECT_SOURCE_DIR}/cmake/Modules/")

include(GLAMER)


####
# sources
####

add_subdirectory(NR)
add_subdirectory(CosmoLib)
add_subdirectory(SLsimLib)

