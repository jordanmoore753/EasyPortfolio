require_relative 'easy_portfolio/input.rb'
require_relative 'easy_portfolio/version.rb'
require 'fileutils'
require 'find'

module Create
  def create_template_directory
    directory = File.expand_path("../easy_portfolio/portfolio_template", __FILE__)
    FileUtils.copy_entry(directory, 'pancake')
  end
end

class EasyPortfolio
  extend Create

  def self.welcome
    'Welcome to EasyPortfolio!'
  end

  def self.all_lib_files
    files = []
    path = File.expand_path("")
    del_pattern = "C:/Users/jorda/Documents/github/EasyPortfolio/"

    Find.find(path) do |pathway|
      files << pathway.gsub(del_pattern, '') if pathway.include?('.')
    end

    files
  end
end
