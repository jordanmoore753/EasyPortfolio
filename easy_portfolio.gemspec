require_relative "lib/easy_portfolio.rb"

Gem::Specification.new do |s|
  s.name        = 'easy_portfolio'
  s.version     = Version.return_current_version_string
  s.executables << 'easy'
  s.date        = '2019-09-19'
  s.summary     = "This gem creates the boilerplate files for a portfolio in Sinatra."
  s.description = "A portfolio-generator in Sinatra"
  s.authors     = ["Jordan Moore"]
  s.email       = 'jordanmoore753@gmail.com'
  s.files       = Dir['lib/**/*', 'test/*', '*']
  s.homepage    =
    'https://github.com/jordanmoore753/EasyPortfolio'
  s.license       = 'MIT'
  s.required_ruby_version = '>= 2.5.0'
end