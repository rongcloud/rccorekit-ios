#
# Be sure to run `pod lib lint RCCoreKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RCCoreKit'
  s.version          = '0.0.1'
  s.summary          = 'RCCoreKit'
  s.description      = "sub module of RCSceneKit, a flexible and configurable UI kit"
  s.homepage         = 'https://github.com/rongcloud/rccorekit-ios.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xuefeng' => 'suixuefeng@rongcloud.cn' }
  s.source           = { :git => 'https://github.com/rongcloud/rccorekit-ios.git', :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'
  s.source_files = 'RCCoreKit/Classes/**/*'
  s.frameworks = 'UIKit'
  s.dependency 'YYModel'
  s.dependency 'SSZipArchive'
  s.dependency 'FCFileManager'
end
