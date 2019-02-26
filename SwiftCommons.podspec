#
# Be sure to run `pod lib lint SwiftCommons.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'SwiftCommons'
    s.version          = '0.1.0'
    s.summary          = 'This is a project to keep all files that are useful when you start creating a new application.'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = <<-DESC
    Nothing to write here actually. Summary says it all: it is just a project to keep all files that are useful when you start creating a new application.
    DESC
    
    s.homepage         = 'https://github.com/boganov/SwiftCommons'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Evgeny Boganov' => 'boganov@gmail.com' }
    s.source           = { :git => 'https://github.com/boganov/SwiftCommons.git', :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/boganov'
    s.swift_version = '4.2'
    s.ios.deployment_target = '9.3'
    
    s.source_files = 'SwiftCommons/Classes/**/*'
    s.resources = 'SwiftCommons/Assets/*'
    
    # s.resource_bundles = {
    #   'SwiftCommons' => ['SwiftCommons/Assets/*.png']
    # }
    
    # s.public_header_files = 'Pod/Classes/**/*.h'
    # s.frameworks = 'UIKit', 'MapKit'
    # s.dependency 'AFNetworking', '~> 2.3'
end
