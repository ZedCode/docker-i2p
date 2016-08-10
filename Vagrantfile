# -*- mode: ruby -*-
# # vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.synced_folder "i2p/", "/home/i2p/.i2p"
  config.vm.define "i2p" do |i2p|
    i2p.vm.provider "docker" do |d|
      d.build_dir = "."
      d.name = "i2p"
      d.ports = ["8080:8080","8443:8443","8081:8081"]
      d.privileged = true
    end
  end
end
