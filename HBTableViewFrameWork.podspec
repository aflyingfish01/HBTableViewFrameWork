 
Pod::Spec.new do |s|
  s.name             = 'HBTableViewFrameWork'
  s.version          = '0.1.3'
  s.summary          = '快速搭建表格框架'
  s.description      = <<-DESC
                        快速搭建表格框架
                       DESC

  s.homepage         = 'https://github.com/hulailin/HBTableViewFrameWork'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hulailin' => 'hulailin@126.com' }
  s.source           = { :git => 'https://github.com/hulailin/HBTableViewFrameWork.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'

  s.source_files = 'HBTableViewFrameWork/Classes/**/*'
  
  # s.resource_bundles = {
  #   'HBTableViewFrameWork' => ['HBTableViewFrameWork/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
