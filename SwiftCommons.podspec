Pod::Spec.new do |s|
    s.name             = 'SwiftCommons'
    s.version          = '0.1.4'
    s.summary          = 'This is a project to keep all files that are useful when you start creating a new application.'
    s.description      = <<-DESC
    Nothing to write here actually. Summary says it all: it is just a project to keep all files that are useful when you start creating a new application.
    DESC
    
    s.homepage         = 'https://github.com/boganov/SwiftCommons'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Evgeny Boganov' => 'boganov@gmail.com' }
    s.source           = { :git => 'https://github.com/boganov/SwiftCommons.git', :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/boganov'
    s.swift_version = '4.2'
    s.ios.deployment_target = '9.0'
    
    s.source_files = 'SwiftCommons/Classes/**/*'
    s.resources = 'SwiftCommons/Assets/*'
end
