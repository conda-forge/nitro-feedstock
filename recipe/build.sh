#!/bin/bash
set -e
set -x
mkdir build
cd build
cmake ${CMAKE_ARGS} -DCMAKE_INSTALL_PREFIX=$PREFIX ${SRC_DIR}
make -j${CPU_COUNT}
make install
