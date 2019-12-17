# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV["LC_CTYPE"] = "en_US.UTF-8"

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = "dev-sbx"

  config.vm.provider "virtualbox" do |vbox|
    vbox.customize ["modifyvm", :id, "--cpus", 1]
    vbox.customize ["modifyvm", :id, "--memory", 1024]
    vbox.customize ["modifyvm", :id, "--name", "dev-sbx"]
  end

  config.vm.network "forwarded_port", guest: 22,   host: 49152, id: "ssh"
  config.vm.network "forwarded_port", guest: 3000, host: 49153, id: "express"
  config.vm.network "forwarded_port", guest: 5000, host: 49154, id: "flask"
  config.vm.network "forwarded_port", guest: 8000, host: 49155, id: "django"
  config.vm.network "forwarded_port", guest: 8888, host: 49156, id: "jupyter"

  # root provisioning
  config.vm.provision "shell", name: "System Tools", path: ".Vagrantstrap/add-system-tools.sh"

  # user provisioning
  config.vm.provision "shell", name: "User Tools", path: ".Vagrantstrap/add-user-tools.sh", privileged: false
  config.vm.provision "file", source: ".Vagrantstrap/.bashrc", destination: ".bashrc"
  config.vm.provision "file", source: ".Vagrantstrap/.profile", destination: ".profile"

end
