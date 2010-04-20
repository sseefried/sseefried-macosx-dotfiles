module TryInSubdir

  def run(dir, cmd)
    current = Dir.pwd
    until File.directory?(dir) || Dir.pwd == '/'
      Dir.chdir("..")
    end
    if Dir.pwd == '/'
      puts "Could not find directory `#{dir}' in which to run command"
    else
      system(cmd) 
    end
    Dir.chdir(current)
  end

end
