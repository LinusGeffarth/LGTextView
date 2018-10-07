
Pod::Spec.new do |s|
  s.name             = 'LGTextView'
  s.version          = '1.0.0'
  s.summary          = 'Simple UITextView subclass that features an IBInspectable placeholder'

  s.description      = <<-DESC
Simple UITextView subclass that features an IBInspectable placeholder written purely in Swift 4.2
                       DESC

  s.homepage         = 'https://github.com/linusgeffarth/LGTextView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'linusgeffarth' => 'linus@geffarth.com' }
  s.source           = { :git => 'https://github.com/linusgeffarth/LGTextView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/linusgeffarth'

  s.ios.deployment_target = '8.0'
  s.swift_version = '4.2'

  s.source_files = 'LGTextView/Classes/**/*'
  
  s.frameworks = 'UIKit'

end
