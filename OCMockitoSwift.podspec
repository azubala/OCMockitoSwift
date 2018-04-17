Pod::Spec.new do |s|
  s.name      = "OCMockitoSwift"
  s.version   = "0.3.4"
  s.swift_version = "4.0"
  s.summary   = "Swift adapter for OCMockito"
  s.description = <<-DESC
        OCMockito adapter for Swift, that allows to create and operate on mocks which are subclasses of NSObject.
                      DESC
  s.authors   = { "Aleksander Zubala" => "alek@zubala.com"}
  s.source    = { :git => "https://github.com/azubala/OCMockitoSwift.git", :tag => s.version.to_s}
  s.homepage  = "https://github.com/azubala/OCMockitoSwift"
  s.license   = { :type => 'MIT', :file => 'LICENSE' }

  s.ios.deployment_target = '8.0'

  s.source_files          = "Classes/**/*.{h,m,swift}"

  s.ios.frameworks = 'Foundation', 'CoreFoundation'

  s.dependency  'OCMockito', '~> 5.0.1'
  s.dependency  'OCHamcrest', '~> 7.0'

  s.requires_arc = true
end
