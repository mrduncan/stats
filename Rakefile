require 'rake/testtask'

task :default => :test

desc "Runs all tests"
task :test => ['test:unit', 'test:integration']

namespace :test do
  desc "Runs unit tests"
  Rake::TestTask.new(:unit) do |t|
    t.libs << 'test'
    t.test_files = FileList['test/unit/test_*.rb']
  end

  desc "Runs integration tests"
  Rake::TestTask.new(:integration) do |t|
    t.libs << 'test'
    t.test_files = FileList['test/integration/test_*.rb']
  end
end

desc "Build a gem"
task :gem => [:gemspec, :build]

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "stats"
    gemspec.summary = "Easily keep track of vital stats using Redis."
    gemspec.email = "matt@mattduncan.org"
    gemspec.homepage = "http://github.com/mrduncan/stats"
    gemspec.authors = ["Matt Duncan"]
    gemspec.version = '0.1.0'
    gemspec.add_dependency 'redis'
    gemspec.description = <<description
The stats gem is a simple way to keep track of different statistics using
Redis.
description
  end
rescue LoadError
  warn "Jeweler not available. Install it with:"
  warn "gem install jeweler"
end
