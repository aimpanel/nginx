# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

#wheezy64build
  config.vm.define "wheezy64build" do |wheezy64build|
    wheezy64build.vm.box = "deb/wheezy-amd64"
    wheezy64build.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 7
    end
    wheezy64build.vm.hostname = "wheezy64build.aimpanel.pro"
    wheezy64build.vm.provision "shell", path: "wheezy64/build.sh"
  end

end
