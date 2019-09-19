class Version
  def self.increment
    current_version = self.return_current_version
    new_version = return_new_version_number(current_version)
    write_new_version(new_version)
  end

  def self.replace_version_number(correct_version)
    write_new_version(correct_version)
  end

  def self.return_current_version_string
    File.read(return_path)
  end

  def self.return_current_version
    File.read(return_path).split('.').map do |entry|
      entry.gsub("'", '')
    end
  end

  private

  def self.return_new_version_number(version_array)
    if version_array[1] == '9' && version_array[2] == '9'
      version_array[0] = version_array[0].to_i + 1
      version_array[1], version_array[2] = 0, 0
    elsif version_array[2] == '9'
      version_array[1] = version_array[1].to_i + 1
      version_array[2] = 0
    else
      version_array[2] = version_array[2].to_i + 1
    end

    version_array.join('.')
  end

  def self.write_new_version(new_version)
    File.open(return_path, "w") do |io|
      io << new_version
    end
  end

  def self.return_path
    path = File.expand_path("version_number.txt")
    path.slice!('/lib/easy_portfolio')
    path.slice!('/lib')
    path
  end
end
