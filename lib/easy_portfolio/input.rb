class Input
  VALID_OPTIONS = %w(y n)

  def ask_yes_or_no
    loop do 
      answer = command_line_input.downcase
      return answer if VALID_OPTIONS.include?(answer)
      puts 'Please input either y (yes) or n (no).'
    end
  end

  def action_verified?(input)
    input.downcase == 'y' ? true : false
  end

  def answer_is_yes?(answer)
    answer == 'y' ? true : false
  end
  
  private

  def answer_is_yes?(answer)
    answer == 'y' ? true : false
  end

  def command_line_input
    $stdin.gets.chomp
  end
end
