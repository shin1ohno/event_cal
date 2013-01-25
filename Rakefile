begin
  require 'bundler'
  require 'bundler/setup'
  require 'bundler/gem_tasks'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rspec/core/rake_task'
require 'jasmine-headless-webkit'

RSpec::Core::RakeTask.new(:spec)
Jasmine::Headless::Task.new

if ENV['SKIP_JASMINE']
  task :default => [:spec]
else
  task :default => [:spec, 'jasmine:headless']
end

Bundler::GemHelper.install_tasks
