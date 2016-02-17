Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"

  # create control machine which can run ansible playbooks
  config.vm.define "control" do |control_config|
      control_config.vm.box = "ubuntu/trusty64"
      control_config.vm.hostname = "control"
      control_config.vm.network :private_network, ip: "192.168.10.1"
      control_config.vm.provider "virtualbox" do |vb|
        vb.memory = "256"
      end
      control_config.vm.provision :shell, path: "bootstrap-control-ansible.sh"
  end

  # create a server which can be used to run playbooks on and configure
  config.vm.define "server" do |server_config|
      server_config.vm.box = "ubuntu/trusty64"
      server_config.vm.hostname = "server"
      server_config.vm.network :private_network, ip: "192.168.10.2"
      server_config.vm.network "forwarded_port", guest: 80, host: 8080
      server_config.vm.provider "virtualbox" do |vb|
        vb.memory = "256"
      end
  end

  
  # following code can be used to create more than one servers (if you need that you can use as per the playbook roles)
  #  source : https://docs.vagrantup.com/v2/vagrantfile/tips.html 
  #(1..2).each do |i|
  #  config.vm.define "server#{i}" do |node|
  #      node.vm.box = "ubuntu/trusty64"
  #      node.vm.hostname = "server#{i}"
  #      node.vm.network :private_network, ip: "10.0.15.2#{i}"
  #      node.vm.network "forwarded_port", guest: 80, host: "808#{i}"
  #      node.vm.provider "virtualbox" do |vb|
  #        vb.memory = "256"
  #      end
  #  end
  #end

end
