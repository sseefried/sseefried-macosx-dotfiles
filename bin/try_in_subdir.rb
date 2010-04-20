module TryInSubdir

  def run(dir, cmd)
    until File.directory?(dir) || Dir.pwd == '/'
      Dir.chdir("..")
    end
    if Dir.pwd == '/'
      puts "Could not find directory `#{dir}' in which to run command"
    else
      system(cmd) 
    end
  end

end
