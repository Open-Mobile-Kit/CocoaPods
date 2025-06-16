Pod::Spec.new do |s|
  s.name             = 'CocoaPods'
  s.version          = '1.0.0'
  s.summary          = 'A dynamic CocoaPods system for iOS and macOS'
  s.description      = <<-DESC
                       A comprehensive event bus library that allows for dynamic event handling across components.
                       Provides a robust infrastructure for event-driven architecture in iOS applications.
                       DESC
  s.homepage         = 'https://github.com/Open-Mobile-Kit/CocoaPods'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Open Mobile Kit' => 'openmobilekit@gmail.com' }
  s.source           = { :git => 'https://github.com/Open-Mobile-Kit/CocoaPods.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.swift_version = '5.0'

  s.subspec 'DynamicEventBusBase' do |ss|
    ss.source_files = 'DynamicEventBusBase/DynamicEventBusBase/**/*'
  end
end