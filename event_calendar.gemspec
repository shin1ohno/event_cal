$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "event_calendar/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "event_calendar"
  s.version     = EventCalendar::VERSION
  s.authors     = ["Shin'ichi Ohno"]
  s.email       = ["shin1ohno@gmail.com"]
  s.homepage    = "https://github.com/shin1ohno/event_cal"
  s.summary     = "Calendar with event"
  s.description = "Calendar with event that uses many models"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency 'rails'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'sqlite3'
end
