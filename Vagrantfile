# -*- mode: ruby -*-
#
# two VMs for Ansible testing

Vagrant.configure("2") do |config|
    # only libvirt support
    config.vm.provider "libvirt" do |v|
        v.cpu_mode = "host-passthrough"
        v.driver = "kvm"
        v.memory = 1024
        v.cpus = 1
    end

    # no folder sync
    config.vm.synced_folder ".", "/vagrant", disabled: true

    config.vm.define "test1" do |test1|
        config.vm.box = "fedora/32-cloud-base"
    end

    config.vm.define "test2" do |test2|
        config.vm.box = "fedora/32-cloud-base"
    end
end
