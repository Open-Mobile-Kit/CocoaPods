Pod::Spec.new do |s|
  s.name             = 'DynamicEventBusBase'
  s.version          = '0.0.1'
  s.summary          = 'Dynamic Event Bus Base Framework'
  s.description      = 'Framework that provides dynamic event bus functionality'
  s.homepage         = 'http://yourcompany.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Open Mobile Kit' => 'openmobilekit@gmail.com' }
  s.source           = { :git => 'https://github.com/Open-Mobile-Kit/CocoaPods.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.swift_version = '5.0'

  # Option 1: If you have source code
  s.source_files = 'DynamicEventBusBase/**/*'

  # Option 2: If you only have the binary framework
  # s.vendored_frameworks = 'DynamicEventBusBase.xcframework'
end