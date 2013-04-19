$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "event_cal/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "event_cal"
  s.version     = EventCal::VERSION
  s.authors     = ["Shin'ichi Ohno"]
  s.email       = ["shin1ohno@gmail.com"]
  s.homepage    = "https://github.com/shin1ohno/event_cal"
  s.summary     = "Calendar with event"
  s.description = "Calendar with event that uses many models"

  s.files = Dir["{app,config,db,lib,vendor}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.require_paths = ['lib']

  s.add_dependency 'rails'
  s.add_dependency 'haml-rails'
  s.add_dependency 'bourbon'
  s.add_development_dependency 'rspec', '2.13'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'faker'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'response_code_matchers'
  s.add_development_dependency 'timecop'
  s.add_development_dependency 'jasmine'
  s.add_development_dependency 'jasmine-headless-webkit'
end
