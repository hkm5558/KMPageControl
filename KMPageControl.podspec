#
# Be sure to run `pod lib lint KMPageControl.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = 'KMPageControl'
s.version          = '0.0.3'
s.summary          = '一种常见样式的PageControl 继承于UIPageControl'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = <<-DESC
一种常见样式的PageControl 继承于UIPageControl
DESC

s.homepage         = 'https://github.com/hkm5558/KMPageControl'
# s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'hkm5558' => 'szhuangkm@163.com' }
s.source           = { :git => 'https://github.com/hkm5558/KMPageControl.git', :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

s.swift_version    = '5.0'
s.ios.deployment_target = '9.0'

s.source_files = 'KMPageControl/Classes/**/*'

# s.resource_bundles = {
#   'KMPageControl' => ['KMPageControl/Assets/*.png']
# }

# s.public_header_files = 'Pod/Classes/**/*.h'
s.frameworks = 'UIKit'
# s.dependency 'AFNetworking', '~> 2.3'
end
