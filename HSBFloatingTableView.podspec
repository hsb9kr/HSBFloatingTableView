#
# Be sure to run `pod lib lint HSBFloatingTableView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HSBFloatingTableView'
  s.version          = '0.0.4'
  s.summary          = 'Dropdown tableview'
  s.swift_version    = '5.0'
  
  s.description      = <<-DESC
Dropdown tableview top, bottom.
                       DESC

  s.homepage         = 'https://github.com/hsb9kr/HSBFloatingTableView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Red' => 'hsb9kr@gmail.com' }
  s.source           = { :git => 'https://github.com/hsb9kr/HSBFloatingTableView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'HSBFloatingTableView/Classes/*.swift'
  s.frameworks = 'UIKit'
end
