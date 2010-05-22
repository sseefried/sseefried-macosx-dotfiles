module ShellHelpers

  #
  # Returns +true+ if the current directory is in a rails project.
  #
  def in_rails_project?
    try_in_parent_dirs { File.exist?('config/environment.rb') && File.exist?('Rakefile') }
  end

  module_function :in_rails_project?

  protected
  
  #
  # Tries the given block in directory and parent directories until either the block returns +true+
  # or +Dir.pwd == '/'+
  #
  def self.try_in_parent_dirs
    current = Dir.pwd
    found = false
    until found || Dir.pwd == '/'
      found = yield 
      Dir.chdir("..")
    end
    result = !(Dir.pwd == '/')
    Dir.chdir(current)
    result
  end

end