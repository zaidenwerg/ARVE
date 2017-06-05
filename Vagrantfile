# -*- mode: ruby -*-
# # vi: set ft=ruby :
 
# Specify minimum Vagrant version and Vagrant API version
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"
 
# Require YAML module
require 'yaml'
 
# Read YAML file with box details
servers = YAML.load_file('servers.yaml')
 
# Create boxes
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 
  config.vm.define "sanjer" do |sanjer|
    sanjer.vm.box = "centos/7"
    sanjer.vm.hostname = "sanjer"
    sanjer.vm.network :private_network, ip: "172.24.5.101"
    
    sanjer.vm.provider :virtualbox do |vb|
      vb.name = "sanjer"
      vb.memory = 1024
      vb.cpus = 1
    end

    sanjer.vm.provision "shell" do |ssh|
      #$ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
      ssh.inline = <<-SHELL
       sudo ssh-keygen -t rsa -f /root/.ssh/id_rsa -q -P ""
      # sudo cat /root/.ssh/id_rsa.pub
      SHELL
      end

    $ssh_pub_key_sanjer = sanjer.vm.provision "shell", inline: "sudo cat /root/.ssh/id_rsa.pub"

  end

  # Iterate through entries in YAML file
  servers.each do |servers|
    config.vm.define servers["name"] do |srv|
      srv.vm.box = servers["box"]
      srv.vm.network "private_network", ip: servers ["ip"]
      srv.vm.hostname = servers ["name"]       

      srv.vm.provider :virtualbox do |vb|
        vb.name = servers["name"]
        vb.memory = servers["ram"]
        vb.cpus = servers["cpus"]
      end

      srv.vm.provision "shell" do |ssh|
        ssh_pub_key = $ssh_pub_key_sanjer
        ssh.inline = <<-SHELL
          mkdir -p /root/.ssh
          echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
	  echo #{ssh_pub_key} >> /root/.ssh/authorized_keys
	SHELL
      end

    end
  end
end
