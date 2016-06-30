BOX_NAME = "laptop-k8s.box"
Vagrant.configure(2) do |config|
  config.vm.box = BOX_NAME
  config.vm.box_url = "./laptop-k8s.box"
  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"
  config.vm.box_check_update = true
  config.vm.network "private_network", ip: "192.168.56.10"
  # config.vm.network "forwarded_port", guest: 80, host:80
  # config.vm.network "forwarded_port", guest: 8080, host:8080
  config.vm.hostname = "laptop-k8s"
  config.vm.provider :virtualbox do |vb|
     vb.name = BOX_NAME
     vb.customize ["modifyvm", :id, "--memory", "2048"]
     vb.customize ["modifyvm", :id, "--cpus", "2"]
   end
end