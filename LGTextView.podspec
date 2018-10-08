
Pod::Spec.new do |s|
  s.name             = 'LGTextView'
  s.version          = '1.0.0-localizable'
  s.summary          = 'Simple UITextView subclass that features an IBInspectable placeholder'

  s.description      = <<-DESC
Simple UITextView subclass that features an IBInspectable placeholder written purely in Swift 4.2
                       DESC

  s.homepage         = 'https://github.com/linusgeffarth/LGTextView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'linusgeffarth' => 'linus@geffarth.de' }
s.source           = { :git => 'https://github.com/linusgeffarth/LGTextView.git', :tag => s.version, :branch => "localizable" }
  s.social_media_url = 'https://twitter.com/linusgeffarth'

  s.ios.deployment_target = '9.1'
  s.swift_version = '4.2'

  s.source_files = 'LGTextView/Classes/*.swift'
  
  s.frameworks = 'UIKit'
  s.ios.dependency 'Localize', '~> 2.0.5'

end
