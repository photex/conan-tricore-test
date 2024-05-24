#!/bin/bash

set -e

for profile in tc131 tc161 tc162; do
    # always force a rebuild in order to have a fully logged procedure
    echo "-------------------------------------------------"
    echo "-- Conan Install for '$profile' profile        --"
    conan install . -pr:h=profiles/$profile --build="*" -s build_type=Release
    conan install . -pr:h=profiles/$profile --build="*" -s build_type=Debug
    echo "-------------------------------------------------"
    echo "-- Running CMake workflow for '$profile'       --"
    cmake --workflow --preset=$profile
    echo ""
done


for profile in tc131 tc161 tc162; do
    echo "-------------------------------------------------"
    echo "-- ELF Header for 'foo.cpp.obj'                --"
    tricore-elf-readelf -h build/$profile/CMakeFiles/foo.dir/Debug/src/foo.cpp.obj
    echo ""
done
