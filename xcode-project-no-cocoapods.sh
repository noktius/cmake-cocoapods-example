#!/bin/sh

set -e

echo "Cleaning up the project directory..."
rm -rf *

# Full Project path
PROJECT_DIR=$(cd "$(dirname "$0")"; pwd)

echo "Running cmake for Xcode..."

# CMake script
cmake -G "Xcode" ${PROJECT_DIR} \
    -DCMAKE_OSX_ARCHITECTURES=x86_64 \
    -DCMAKE_C_COMPILER=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang \
    -DCMAKE_CXX_COMPILER=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang++ \
    -DCMAKE_OSX_DEPLOYMENT_TARGET=13.0 \
    -DCMAKE_XCODE_ATTRIBUTE_ONLY_ACTIVE_ARCH=NO \
    -DCMAKE_CONFIGURATION_TYPES="Debug" \
    -DSCENARIO_GIT_REVISION=1234 \
    -DGIT_REVISION=1234 \
    -DBUILD_NUMBER=123