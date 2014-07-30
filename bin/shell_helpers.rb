module ShellHelpers

  #
  # Returns truthy if the current directory is in a rails project.
  #
  def self.in_rails_project?
    try_in_dir_or_parents { File.exist?('config/environment.rb') && File.exist?('Rakefile') }
  end

  #
  # Returns truthy if the there is a .rvmrc file present
  #
  def self.has_rvmrc?
    try_in_dir_or_parents { File.exist?('.rvmrc') }
  end

  #
  # Takes a block and then tests the block in the current directory and all parent directories
  # in order until the block evaluates to truthy or the the root directory '/' is reached.
  # Return the first directory for which the block evaluates to truthy or +nil+.
  #
  # e.g. Say you are searching for the existence of the .ruby-version file. It is in path
  # /Users/billybob/project but you are currently in /Users/billybob/project/lib/tasks
  #
  # > ShellHelpers::try_in_dir_or_parents { File.exist? ".ruby-version" }
  # "/Users/billbob/project"
  #
  # and
  #
  # > ShellHelpers::find_in_dir_or_parent { false }
  # nil
  #
  #
  def self.try_in_dir_or_parents
    current = Dir.pwd # Save current directory
    found = yield
    until found || Dir.pwd == '/'
      Dir.chdir("..")
      found = yield
    end
    dir = Dir.pwd if found
    Dir.chdir(current) # Restore current directory
    dir
  end

end