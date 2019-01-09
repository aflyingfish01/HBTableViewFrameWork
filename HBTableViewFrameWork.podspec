
Pod::Spec.new do |s|
 
  s.name         = "HBTableViewFrameWork"
  s.version      = "0.0.1"
  s.summary      = "快速搭建表格框架"
  s.description  = <<-DESC
                  快速搭建表格框架
                 DESC
  s.homepage     = "https://github.com/hulailin/HBTableViewFrameWork"
  s.license              = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "hulailin" => "376999818@qq.com" }
  s.social_media_url   = " "
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/hulailin/HBTableViewFrameWork.git", :tag => s.version }
  s.source_files  = "TableViewFrameWork/*.{h,m}"
   
  s.requires_arc = true
 
end
 