cmake_minimum_required(VERSION 3.26)

project(FooLib C CXX)

find_package(ZLIB REQUIRED)

add_library(foo STATIC include/foo.hpp src/foo.cpp)
target_include_directories(foo PUBLIC include)
target_link_libraries(foo PUBLIC ZLIB)
