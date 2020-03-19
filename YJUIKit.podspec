Pod::Spec.new do |spec|

spec.name         = "YJUIKit"
spec.version      = "0.0.8"
spec.summary      = "YJUIKit for iOS"
spec.homepage     = "https://github.com/MOyejin/YJUIKit"
spec.license      = { :type => "MIT", :file => "LICENSE" }
spec.author       = { "MOyejin" => "1976779764@qq.com" }
spec.platform     = :ios, '9.0'
spec.source       = { :git => "https://github.com/MOyejin/YJUIKit.git", :tag => "#{spec.version}" }
spec.source_files = "YJUIKit/**/*.{h,m}"
spec.requires_arc = true
spec.frameworks   = 'UIKit', 'Foundation'
spec.library      = "resolv"

spec.dependency "MJRefresh"
spec.dependency "Masonry"
spec.dependency "YJFoundation"


end
