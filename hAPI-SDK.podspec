#
# Be sure to run `pod lib lint MyLibrary.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "hAPI-SDK"
  s.version          = "1.0.26"
  s.summary          = "hAPI-SDK"
  s.description      = "iOS Helper Methods for interacting with MedHelp's 'Health' API or 'hAPI'" 
  s.homepage         = "https://github.com/medhelpintl/iphone_hAPI-SDK"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "medhelp" => "iphone@medhelp.org" }
  s.source           = { :git => "https://github.com/medhelpintl/iphone_hAPI-SDK.git", :tag => s.version.to_s }

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Pod/Headers'

  s.preserve_paths = 'Pod/libhAPISDK.a' 
  s.ios.vendored_library = 'Pod/libhAPISDK.a'
end
