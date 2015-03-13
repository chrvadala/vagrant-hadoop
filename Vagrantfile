
Vagrant.configure(2) do |config|
  config.vm.box = "parallels/ubuntu-14.04"

  config.vm.network "private_network", ip: "192.168.50.50"


  config.vm.provider "parallels" do |v|
    v.memory = 4096
    v.cpus = 6
  end

  config.vm.provision "shell", path: "src-env/install_hadoop.sh"
end



# NOTA:
# Aggiungere la seguente riga nel file hosts (senza #)
# 192.168.50.50	hadoop.dev vagrant.vm