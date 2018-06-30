Pod::Spec.new do |s|

  s.name         = "ReactiveBind"
  s.version      = "1.0.0"
  s.summary      = "ReactiveBind bind helps make MVVM binding easier"
  s.homepage     = "https://github.com/naderbesada/ReactiveBind"
  s.license      = "MIT"
  s.author       = { "Nader Besada" => "nrbesada@icloud.com" }

  # s.social_media_url   = "http://twitter.com/Nader Besada"

  s.platform     = :ios, "11.0"
  s.source       = { :git => "https://github.com/naderbesada/ReactiveBind.git", :tag => s.version.to_s }
  s.source_files = "ReactiveBind/ReactiveBind/**/*"

end
