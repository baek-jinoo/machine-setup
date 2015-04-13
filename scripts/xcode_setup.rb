#!/usr/bin/env ruby

def shell_cmd(command)
  `#{command}`
  process_status = $?
  raise process_status.to_s unless process_status.success?
end

def clone_git_repository(repository_url, target_directory)
  shell_cmd "mkdir -p #{target_directory}"
  shell_cmd "cd #{target_directory} && git clone #{repository_url}"
end

def install_gem(name)
  begin
    gem name
  rescue Gem::LoadError
    shell_cmd "gem install #{name} --no-ri --no-rdoc"
  end
end

def install(name, target_directory, command)
  current_directory = Dir.pwd
  Dir.chdir "#{target_directory}/#{name}"
  shell_cmd command
  Dir.chdir current_directory
end

def setup_cedar_shortcuts
  name = 'CedarShortcuts'
  target_directory = "/tmp/__installs/#{name}"
  shell_cmd "rm -rf #{target_directory}"
  clone_git_repository('https://github.com/cppforlife/CedarShortcuts.git', target_directory)
  install_gem('rake')
  install(name, target_directory, 'rake install')
end

setup_cedar_shortcuts

