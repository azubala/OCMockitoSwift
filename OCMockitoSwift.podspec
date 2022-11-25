Pod::Spec.new do |s|
  s.name      = "OCMockitoSwift"
  s.version   = "0.8.0"
  s.swift_version = "4.2"
  s.summary   = "Swift adapter for OCMockito"
  s.description = <<-DESC
        OCMockito adapter for Swift, that allows to create and operate on mocks which are subclasses of NSObject.
                      DESC
  s.authors   = { "Aleksander Zubala" => "alek@zubala.com"}
  s.source    = { :git => "https://github.com/azubala/OCMockitoSwift.git", :tag => s.version.to_s}
  s.homepage  = "https://github.com/azubala/OCMockitoSwift"
  s.license   = { :type => 'MIT', :file => 'LICENSE' }

  s.ios.deployment_target = '11.0'

  s.source_files          = "Sources/OCMockitoSwift/*.{h,m,swift}"

  s.ios.frameworks = 'Foundation', 'CoreFoundation'

  s.dependency  'OCMockito', '~> 6.0.0'
  s.dependency  'OCHamcrest', '~> 8.0'

  s.requires_arc = true
end
