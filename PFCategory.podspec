
Pod::Spec.new do|s|
s.name = 'PFCategory'
s.verson = '1.0.0'
s.summary = 'An easy way'
s.homepage = 'https://github.com/Fly-Pan/PublicCategory'
s.license              = { :type => "MIT", :file => "LICENSE" }

s.platform = :ios
s.author = {'panfei' => '471311140@qq.com'}
s.ios.deployment_target = '8.0'
s.source = {:git => 'https://github.com/Fly-Pan/PublicCategory.git',:tag => s.version}
s.source_fils = 'Category/*.{h,m}'
s.resources = 'Category/*.{png,xib,nib,bundle}'
s.requires_arc = true
s.frameworks = 'CoreLocation'

