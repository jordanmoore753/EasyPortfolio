require_relative 'easy_portfolio/input.rb'
require_relative 'easy_portfolio/output.rb'
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

  OUTPUT = Output.new
  INPUT = Input.new

  def self.execute
    opening_actions
    answer = input_action
    action_verified?(answer) ? directory_creation_actions : refusal_action

    ending_action
  end 

  private

  def self.opening_actions
    OUTPUT.welcome
    OUTPUT.describe
    OUTPUT.ask_for_permission
  end

  def self.directory_creation_actions
    OUTPUT.permission_confirmation

    if template_already_exists?
      OUTPUT.directory_exists
    else
      OUTPUT.directory_doesnt_exist
      create_template_directory
      OUTPUT.git_bundle_notification
      perform_git_and_bundler_actions
      OUTPUT.successful_installation
    end
  end

  def self.input_action
    INPUT.ask_yes_or_no
  end

  def self.refusal_action
    OUTPUT.permission_rejection
  end

  def self.ending_action
    OUTPUT.shut_down
  end

  def self.action_verified?(input)
    input.downcase == 'y' ? true : false
  end
end
