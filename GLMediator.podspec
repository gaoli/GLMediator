Pod::Spec.new do |s|
  s.name             = 'GLMediator'
  s.version          = '1.0.0'
  s.summary          = 'A modular solution for iOS'

  s.description      = <<-DESC
                        GLMediator is a modular solution for iOS
                       DESC

  s.homepage         = 'https://github.com/gaoli/GLMediator'
  s.license          = 'MIT'
  s.author           = { 'gaoli' => '3071730@qq.com' }
  s.source           = { :git => 'https://github.com/gaoli/GLMediator.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'GLMediator/Classes/**/*'
end