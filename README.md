# Demonstration of Static Library Linking Errors with CMake and CocoaPods

This repository contains a test project designed to demonstrate issues encountered when linking static ```.a``` libraries after running CocoaPods. The focus is on issues related to the integration of CMake-generated Xcode projects with CocoaPods dependencies.


## Prerequisites

This code was tested in April 2024 with following specs:

* Xcode 15.3
* CMake 3.29.0
* CocoaPods 1.15.2

## Setup for Debugging

To facilitate effective debugging, it's recommended to create a new shadow build folder. This approach helps isolate build artifacts from the source directory, allowing for cleaner builds and easier problem identification.


## Building with CocoaPods

~~~
mkdir cmake-build
cd cmake-build
chmod +x /path/to/source/xcode-project.sh # Make the build script executable
/path/to/source/xcode-project.sh # Execute the build script
~~~

This script configures and generates an Xcode project in the shadow build directory. It handles the necessary CMake commands and integrates CocoaPods dependencies.

## Running the Project

After building, proceed with these steps to run the project:

1. Open the generated Xcode Workspace ```myApp.xcworkspace``` project in the cmake-shadow-build directory.
2. Select the ```myApp``` target for macOS.
3. Hit the Run button to build and execute the project on your Mac.
4. Expected Error: You should run into a compile error ```can't locate file for: -lPods-libfoo``` or something like ```can't locate .a file```. This is the anticipated issue we're demonstrating!


## Try it without CocoaPods!

~~~
chmod +x /path/to/source/xcode-project-no-cocoapods.sh # Make the build script executable
/path/to/source/xcode-project-no-cocoapods.sh # Execute the build script
~~~

After executing the script, rebuild the project in Xcode as described earlier. You'll notice that it compiles and runs flawlessly, showcasing the difference CocoaPods can make in the build process.