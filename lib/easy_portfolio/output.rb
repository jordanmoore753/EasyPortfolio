class Output
  TEMPLATE = "'easy_portfolio_template'"

  def welcome
    message 'Welcome to EasyPortfolio!'
  end

  def describe
    message 'EasyPortfolio creates a Sinatra-powered portfolio skeleton.'
  end

  def ask_for_permission
    message 'Would you like to install the project directory?'
    message "This will create a directory named #{TEMPLATE} in your current directory."
    message "Type 'y' to continue or 'n' to stop."
  end

  def permission_confirmation
    message 'Great! Checking the directory now for validation.'
  end

  def directory_exists
    message 'Sorry, I cannot perform the operation.'
    message "A directory in your current directory already has the name #{TEMPLATE}."
  end

  def directory_doesnt_exist
    message 'The directory has been validated. I will begin installation now.'
  end

  def permission_rejection
    message "Okay, I will not create the directory."
  end

  def git_bundle_notification
    message "Initializing the directory in Git and installing bundler."
    message "Don't worry, this may take a tiny bit."
  end

  def successful_installation
    message 'All directories and files successfully installed.'
  end

  def shut_down
    message 'EasyPortfolio shutting down.'
    message 'Have a great day!'
  end

  private

  def message(string)
    puts "<< #{string}"
  end
end
