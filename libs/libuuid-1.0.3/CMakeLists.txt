cmake_minimum_required(VERSION 2.8)

project(libuuid C)


file(GLOB SOURCES ./*.c)

add_library(libuuid STATIC ${SOURCES})
