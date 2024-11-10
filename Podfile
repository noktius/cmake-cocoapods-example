require 'xcodeproj'

#use_modular_headers!

#platform :ios, '13.0'
platform :osx, '13.0'

plugin "cocoapods-static-swift-framework"
workspace 'MyWorkspace'
use_frameworks!

#all_binary!


target 'libbar' do
  #inherit! :search_paths
  pod 'PromisesObjC'
  #pod 'GoogleMLKit/TextRecognition'
end

# not important..
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
    end
  end
end