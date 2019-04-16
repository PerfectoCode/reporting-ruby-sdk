$:.push File.expand_path('../lib', __FILE__)
require 'perfecto-reporting/version'

Gem::Specification.new do |s|
  s.name        = 'perfecto-reporting'
  s.version     = Reporting::Perfecto::VERSION
  s.date        = '2018-07-08'
  s.summary     = "perfecto reporting sdk"
  s.description = "Perfecto Reporting is a multiple execution digital report, that enables quick navigation within your latest build execution. Get visibility of your test execution status and quickly identify potential problems with an aggregated report.
Hone-in and quickly explore your test results all within customized views, that include logical steps and synced artifacts. Distinguish between test methods within a long execution. Add personalized logical steps and tags according to your team and organization.\n For release notes see: https://github.com/PerfectoCode/Samples/blob/master/Reporting/README.md"
  s.authors     = ["perfecto"]
  s.email       = 'yuvals@perfectomobile.com'
  s.files       = Dir['Rakefile', '{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*'] 
  s.homepage    =
    'http://rubygems.org/gems/Perfecto-Reporting'
  s.license       = 'MIT'

  # dependencies 
  s.add_runtime_dependency 'selenium-webdriver', '>= 2.53.0'
end
