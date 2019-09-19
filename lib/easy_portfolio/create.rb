require 'fileutils'

module Create
  def create_template_directory
    destination = File.basename(Dir.pwd)
    directory = File.expand_path("../../portfolio_template", __FILE__)
    puts destination
    puts directory
    FileUtils.copy_entry(directory, 'pancake')
  end
end