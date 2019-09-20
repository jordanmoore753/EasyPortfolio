require 'minitest/autorun'
require 'fileutils'
require 'easy_portfolio'

class EasyPortfolioTest < Minitest::Test
  def setup

  end

  def remove_project_template
    FileUtils.rm_r 'easy_portfolio_template'
  end

  # Input Class

  def test_ask_yes_or_no_affirmative
    $stdin = StringIO.new('y')
    assert_equal 'y', Input.new.send(:ask_yes_or_no)
  end

  def test_ask_yes_or_no_negative
    $stdin = StringIO.new('n')
    assert_equal 'n', Input.new.send(:ask_yes_or_no)
  end

  def test_action_verified?
    action_is_no = Input.new.send(:action_verified?, "n")
    action_is_yes = Input.new.send(:action_verified?, "y")

    assert_equal true, action_is_yes
    assert_equal false, action_is_no
  end

# EasyPortfolio Class and FileAction Module

  def test_portfolio_dir_created
    EasyPortfolio.create_template_directory

    assert_includes Dir.children(Dir.pwd), "easy_portfolio_template"
    assert_includes Dir.children(Dir.pwd + "/easy_portfolio_template"), "views"

    remove_project_template
  end

  def test_template_already_exists_in_dir
    EasyPortfolio.create_template_directory

    bool = EasyPortfolio.template_already_exists?

    assert_equal bool, true

    remove_project_template

    bool = EasyPortfolio.template_already_exists?

    assert_equal bool, false
  end

  def test_git_bundler_actions_completed
    EasyPortfolio.create_template_directory

    assert_includes Dir.children(Dir.pwd), "easy_portfolio_template"
    assert_includes Dir.children(Dir.pwd + "/easy_portfolio_template"), "views"

    EasyPortfolio.perform_git_and_bundler_actions

    assert_includes Dir.children(Dir.pwd + "/easy_portfolio_template"), ".git"
    assert_includes Dir.children(Dir.pwd + "/easy_portfolio_template"), "Gemfile.lock"

    remove_project_template
  end

  def test_execute_affirmative
    $stdin = StringIO.new('y')
    EasyPortfolio.send(:execute)

    assert_includes Dir.children(Dir.pwd + "/easy_portfolio_template"), ".git"
    assert_includes Dir.children(Dir.pwd + "/easy_portfolio_template"), "Gemfile.lock"

    remove_project_template
  end

  def test_execute_negative
    $stdin = StringIO.new('n')
    EasyPortfolio.send(:execute)

    refute_includes Dir.children(Dir.pwd), "easy_portfolio_template"
  end

  def test_portfolio_all_views_included

  end

  def test_portfolio_all_stylesheets_included

  end

  def test_portfolio_all_root_files_included

  end

# Version Class

  def test_version_number_increment
    start_version = Version.return_current_version
    only_numbers = start_version.map(&:to_i)

    Version.increment

    incremented_version = Version.return_current_version
    inc_only_numbers = incremented_version.map(&:to_i)

    if only_numbers[1] == 9 && only_numbers[2] == 9
      assert_equal only_numbers[0] + 1, inc_only_numbers[0]
    elsif only_numbers[2] == 9
      assert_equal only_numbers[1] + 1, inc_only_numbers[1]
    else
      assert_equal only_numbers[2] + 1, inc_only_numbers[2]
    end

    Version.replace_version_number(only_numbers.join('.'))

    assert_equal start_version, Version.return_current_version
  end
end