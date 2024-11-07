cmake_minimum_required(VERSION 3.16)

project(myProject LANGUAGES CXX OBJCXX Swift)


add_subdirectory(main)
add_subdirectory(libfoo)
add_subdirectory(libbar)

file(GLOB_RECURSE PROMISES_OBJC_SOURCES
    RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
    "Pods/PromisesObjC/*.[mh]"
    )

add_library(PromisesObjC ${PROMISES_OBJC_SOURCES})
target_include_directories(PromisesObjC PRIVATE "Pods/PromisesObjC/Sources/FBLPromises/include")

file(GLOB_RECURSE GOOGLE_UTILITIES_SOURCES
    RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
    "Pods/GoogleUtilities/*.[mh]"
    )

add_library(GoogleUtilities ${GOOGLE_UTILITIES_SOURCES})
target_include_directories(GoogleUtilities PRIVATE "Pods/GoogleUtilities")

file(GLOB_RECURSE FIREBASE_CORE_SOURCES 
    RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
    LIST_DIRECTORIES true
    "Pods/FirebaseCore/FirebaseCore/Sources/*.[mh]"
    "Pods/FirebaseCore/FirebaseCore/Sources/Public/*.[mh]"
    "Pods/FirebaseCore/FirebaseCore/Extension/*.h"
    )

add_library(FirebaseCore ${FIREBASE_CORE_SOURCES})
target_include_directories(FirebaseCore PRIVATE "Pods/FirebaseCore" "Pods/FirebaseCore/FirebaseCore/Sources/Public")