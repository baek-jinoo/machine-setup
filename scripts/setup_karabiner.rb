

def setup_karabiner_config
  # cp from ./artifacts/karabiner.json
  # to $HOME/.config/karabiner/karabiner.json
  destination_folder = "#{ENV['HOME']}/.config/karabiner"
  file_name = "karabiner.json"
  destination_file = "#{destination_folder}/#{file_name}"

  if !File.symlink?(destination_file) && !File.directory?(destination_folder) then
    shell_cmd "mkdir -p #{destination_folder} || true"
    shell_cmd "ln -s #{File.expand_path(File.dirname(__FILE__))}/../artifacts/karabiner.json #{destination}" 
  end
end

setup_karabiner_config
