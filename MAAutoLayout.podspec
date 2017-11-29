#
# Be sure to run `pod lib lint MAAutoLayout.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MAAutoLayout'
  s.version          = '1.0.0'
  s.summary          = '简单的autoLayout的系统封装'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                        通过简单的代码完成autoLayout的系统封装，让autoLayout更简洁，同时引入的代码最少。
                       DESC

  s.homepage         = 'https://github.com/fengyunjue/MAAutoLayout'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fengyunjue' => 'ma772528138@qq.com' }
  s.source           = { :git => 'https://github.com/fengyunjue/MAAutoLayout.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MAAutoLayout/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MAAutoLayout' => ['MAAutoLayout/Assets/*.png']
  # }

  s.public_header_files = 'MAAutoLayout/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
