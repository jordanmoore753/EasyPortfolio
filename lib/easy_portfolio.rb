require_relative 'easy_portfolio/input.rb'
require_relative 'easy_portfolio/version.rb'
require 'fileutils'
require 'find'

module FileAction
  def create_template_directory
    directory = File.expand_path("../easy_portfolio/portfolio_template", __FILE__)
    FileUtils.copy_entry(directory, 'easy_portfolio_template')
  end

  def template_already_exists?
    Dir.exist?("easy_portfolio_template")
  end

  def perform_git_and_bundler_actions
    Dir.chdir("easy_portfolio_template") do 
      `git init`
      `gem install bundler`
      `bundle install`
    end
  end
end

class EasyPortfolio
  extend FileAction

  def self.welcome
    'Welcome to EasyPortfolio!'
  end
end
