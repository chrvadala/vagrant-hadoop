
Vagrant.configure(2) do |config|
  config.vm.box = "parallels/ubuntu-14.04"

  config.vm.provider "parallels" do |v|
    v.memory = 4096
    v.cpus = 6
  end

  config.vm.provision "shell", path: "src-env/install_hadoop.sh"
end