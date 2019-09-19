require 'minitest/autorun'
require 'easy_portfolio'

class EasyPortfolioTest < Minitest::Test
  def setup

  end

  def test_welcome
    assert_equal "Welcome to EasyPortfolio!", EasyPortfolio.welcome
  end

  def test_ask_name
    assert_equal "This is where I will ask for your project name.", 
                  Input.ask_name
  end

  def test_portfolio_dir_created
    # EasyPortfolio will copy the folder containing project template from the root of the project
    # Then, EasyPortfolio will create the same folder in the lib dir (current directory).
    EasyPortfolio.create_template_directory
    assert_includes Dir.children(Dir.pwd), "pancake"
    assert_includes Dir.children(Dir.pwd + "/pancake"), "views"
  end

  def test_portfolio_all_dir_included

  end

  def test_portfolio_all_views_included

  end

  def test_portfolio_all_stylesheets_included

  end

  def test_portfolio_all_root_files_included

  end

  def test_portfolio_git_init_added

  end

  def test_portfolio_bundle_installed

  end

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