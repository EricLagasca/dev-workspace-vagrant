# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV["LC_CTYPE"] = "en_US.UTF-8"

$up = <<-SCRIPT
  apt-get update && apt-get upgrade -y
SCRIPT

$docker = <<-SCRIPT
  curl -o- https://get.docker.com | sh
SCRIPT

$dockerCompose = <<-SCRIPT
  curl -fsSL "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
SCRIPT

$nvm = <<-SCRIPT
  git clone https://github.com/nvm-sh/nvm.git ~/.nvm
  cd ~/.nvm && git checkout v0.35.1
SCRIPT

$pyenv = <<-SCRIPT
  git clone https://github.com/pyenv/pyenv.git ~/.pyenv
SCRIPT

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
  config.vm.provision "shell", name: "Update and Upgrade...", inline: $up
  config.vm.provision "shell", name: "Installing Docker CE...", inline: $docker
  config.vm.provision "shell", name: "Installing Docker Compose...", inline: $dockerCompose

  # user provisioning
  config.vm.provision "shell", name: "Installing Node Version Manager...", inline: $nvm, privileged: false
  config.vm.provision "shell", name: "Installing Python Version Management tool...", inline: $pyenv, privileged: false
  config.vm.provision "shell", name: "Installing Python Version Management build dependencies...", path: ".Vagrantstrap/pyenv-build-deps.sh", privileged: false
  config.vm.provision "file", source: ".Vagrantstrap/.bashrc", destination: ".bashrc"
  config.vm.provision "file", source: ".Vagrantstrap/.profile", destination: ".profile"

end
