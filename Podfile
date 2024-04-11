require 'xcodeproj'

use_modular_headers!

workspace "myApp"
platform :ios, '13.0'
project 'myProject.xcodeproj'

target "libfoo" do
    project "myProject"
    inherit! :search_paths

    pod 'GoogleMLKit/TextRecognition'
    pod 'GoogleMLKit/BarcodeScanning'
end
