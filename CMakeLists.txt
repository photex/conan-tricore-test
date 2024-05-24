cmake_minimum_required(VERSION 3.26)

project(FooLib)

find_package(ZLIB REQUIRED)

add_library(foo STATIC include/foo.hpp src/foo.cpp)
target_include_directories(foo PUBLIC include)
target_link_libraries(foo PRIVATE ZLIB::ZLIB)
target_link_options(foo PRIVATE "-Wl,--whole-archive")
