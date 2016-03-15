#
#  Be sure to run `pod spec lint YHCommon.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "YHCommon"
  s.version      = "0.1.3"
  s.summary      = "App common file of YHCommon."

  s.description  = <<-DESC
                   App common file with Pod for APP
                   DESC

  s.homepage     = "https://github.com/yahua/YHCommon"

  s.license      = "MIT"

  s.author             = { "yahua" => "yahua523@163.com" }
  
  s.platform     = :ios, "7.0"
  s.requires_arc = true

  s.source       = { :git => "https://github.com/yahua/YHCommon.git", :tag => "0.1.3" }



  s.source_files  = "YHCommon/YHCommon.h"
  
  s.frameworks = "Foundation", "UIKit"

 pch_AF = <<-EOS
#ifndef TARGET_OS_IOS
  #define TARGET_OS_IOS TARGET_OS_IPHONE
#endif
#ifndef TARGET_OS_WATCH
  #define TARGET_OS_WATCH 0
#endif
#ifndef TARGET_OS_TV
  #define TARGET_OS_TV 0
#endif
EOS
  s.prefix_header_contents = pch_AF
  
  s.ios.deployment_target = '7.0'
  
  s.subspec 'extobjc' do |ss|
    ss.ios.deployment_target = '7.0'

    ss.public_header_files = 'YHCommon/extobjc/*.h'
    ss.source_files = 'YHCommon/extobjc'
  end

  s.subspec 'NSData' do |ss|
    ss.ios.deployment_target = '7.0'

    ss.public_header_files = 'YHCommon/NSData/*.h'
    ss.source_files = 'YHCommon/NSData'
  end

  s.subspec 'NSDate' do |ss|
    ss.ios.deployment_target = '7.0'

    ss.public_header_files = 'YHCommon/NSDate/*.h'
    ss.source_files = 'YHCommon/NSDate'
  end

  s.subspec 'NSString' do |ss|
    ss.ios.deployment_target = '7.0'
    ss.dependency 'YHCommon/NSData'

    ss.public_header_files = 'YHCommon/NSString/*.h'
    ss.source_files = 'YHCommon/NSString'
  end

  s.subspec 'NSTimer' do |ss|
    ss.ios.deployment_target = '7.0'

    ss.public_header_files = 'YHCommon/NSTimer/*.h'
    ss.source_files = 'YHCommon/NSTimer'
  end

  s.subspec 'UIColor' do |ss|
    ss.ios.deployment_target = '7.0'

    ss.public_header_files = 'YHCommon/UIColor/*.h'
    ss.source_files = 'YHCommon/UIColor'
  end

  s.subspec 'UIDevice' do |ss|
    ss.ios.deployment_target = '7.0'

    ss.public_header_files = 'YHCommon/UIDevice/*.h'
    ss.source_files = 'YHCommon/UIDevice'
  end

  s.subspec 'UIImage' do |ss|
    ss.ios.deployment_target = '7.0'

    ss.public_header_files = 'YHCommon/UIImage/*.h'
    ss.source_files = 'YHCommon/UIImage'
  end

  s.subspec 'UIButton' do |ss|
    ss.ios.deployment_target = '7.0'

    ss.public_header_files = 'YHCommon/UIButton/*.h'
    ss.source_files = 'YHCommon/UIButton'
  end

  s.subspec 'UIAlertView' do |ss|
    ss.ios.deployment_target = '7.0'

    ss.public_header_files = 'YHCommon/UIAlertView/*.h'
    ss.source_files = 'YHCommon/UIAlertView'
  end

  s.subspec 'UILable' do |ss|
    ss.ios.deployment_target = '7.0'

    ss.public_header_files = 'YHCommon/UILable/*.h'
    ss.source_files = 'YHCommon/UILable'
  end

  s.subspec 'UITextField' do |ss|
    ss.ios.deployment_target = '7.0'

    ss.public_header_files = 'YHCommon/UITextField/*.h'
    ss.source_files = 'YHCommon/UITextField'
  end

  s.subspec 'UINavigationController' do |ss|
    ss.ios.deployment_target = '7.0'

    ss.public_header_files = 'YHCommon/UINavigationController/*.h'
    ss.source_files = 'YHCommon/UINavigationController'
  end

  s.subspec 'UIViewController' do |ss|
    ss.ios.deployment_target = '7.0'

    ss.public_header_files = 'YHCommon/UIViewController/*.h'
    ss.source_files = 'YHCommon/UIViewController'
  end

  s.subspec 'YHKVOController' do |ss|
    ss.ios.deployment_target = '7.0'

    ss.public_header_files = 'YHCommon/YHKVOController/*.h'
    ss.source_files = 'YHCommon/YHKVOController'
  end

end
