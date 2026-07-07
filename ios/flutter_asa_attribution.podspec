#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_asa_attribution.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_asa_attribution'
  s.version          = '1.1.1'
  s.summary          = 'A apple search ads attribution plugin for flutter'
  s.description      = <<-DESC
A apple search ads attribution plugin for flutter
                       DESC
  s.homepage         = 'https://github.com/lianshumin/flutter_asa_attribution'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'liam' => 'shuminlian@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'flutter_asa_attribution/Sources/flutter_asa_attribution/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '14.3'
  s.frameworks = 'AdServices'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
