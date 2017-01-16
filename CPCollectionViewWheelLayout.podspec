Pod::Spec.new do |s|

  s.name         = "CPCollectionViewWheelLayout"
  s.version      = "1.0.1"
  s.summary      = "An interested wheel layout of collection view."

  s.description  = <<-DESC
                   An interested wheel layout of collection view!
                   DESC

  s.homepage     = "https://github.com/mingweizhang/CPCollectionViewWheelLayout"
  s.screenshots  = "https://github.com/mingweizhang/CPCollectionViewWheelLayout/raw/master/CollectionViewWheelLayoutDemo/Demo.gif?raw=true"
  s.license      = "MIT (LICENSE)"
  s.author             = { "ParsifalC" => "zmw@izmw.me" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/mingweizhang/CPCollectionViewWheelLayout.git", :tag => "1.0.1" }
  s.source_files  = "CPCollectionViewWheelLayout/*.{h,m}"
  s.frameworks = 'UIKit'

end
