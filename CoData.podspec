Pod::Spec.new do |s|

  s.name         = "CoData"
  s.version      = "0.1.0"
  s.summary      = "Swift Codable storage"
  s.description  = "Easy to use Codable based NoSQL database in swift."
  s.homepage     = "https://github.com/kaqu/codata/"
  s.license      = { :type => "Apache 2.0", :file => "LICENSE" }
  s.author       = { "Kacper Kaliński" => "kaqukal@icloud.com" }
  s.source       = { :git => "https://github.com/kaqu/codata.git", :tag => "#{s.version}" }
  s.source_files = "Sources/CoData/*.swift"

  # TODO: add dependency to futura when 2.1.0 released 
end