require 'rake/testtask'
require_relative 'lib/easy_portfolio.rb'

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc "Run tests"
task :default => :test

desc "increment version, build and install gem"
task :build_install do 
  Version.increment
  current_version = Version.return_current_version_string
  sh "gem build easy_portfolio.gemspec"
  sh "gem install easy_portfolio-#{current_version}.gem"
end
