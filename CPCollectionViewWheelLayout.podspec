Pod::Spec.new do |s|

  s.name         = "CPCollectionViewWheelLayout"
  s.version      = "1.0.2"
  s.summary      = "An interested wheel layout of collection view."

  s.description  = <<-DESC
                   An interested wheel layout of collection view!
                   DESC

  s.homepage     = "https://github.com/ParsifalC/CPCollectionViewWheelLayout"
  s.screenshots  = "https://github.com/ParsifalC/CPCollectionViewWheelLayout/raw/master/CollectionViewWheelLayoutDemo/Demo.gif?raw=true"
  s.license      = "MIT (LICENSE)"
  s.author             = { "ParsifalC" => "zmw@izmw.me" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/ParsifalC/CPCollectionViewWheelLayout.git", :tag => s.version.to_s }
  s.source_files  = "CPCollectionViewWheelLayout/**/*.{h,m}"
  s.frameworks = 'UIKit'

end
