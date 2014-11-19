#
# Be sure to run `pod lib lint MyLibrary.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "hAPI SDK"
  s.version          = "1.0.0"
  s.summary          = "hAPI SDK"
  s.description      = <<-DESC
                       An optional longer description of MyLibrary

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/medhelpintl/iphone_hAPI-SDK"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "medhelp" => "iphone@medhelp.org" }
  s.source           = { :git => "https://github.com/medhelpintl/iphone_hAPI-SDK.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'hAPI SDK' => ['Pod/Assets/*.png', '*.a']
  }

  s.preserve_paths = 'Pod/libhAPISDK.a' 
  s.xcconfig = {'LIBRARY_SEARCH_PATHS'=>"\"$(SRCROOT)/Pods/**\""}  
  s.ios.vendored_library = 'Pod/libhAPISDK.a'
  #
  s.dependency 'AFNetworking', '~> 1.3.3'
end
