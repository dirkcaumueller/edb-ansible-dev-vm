# -*- mode: ruby -*-
# vi: set ft=ruby :

# Configure vm
cluster = {
  "server8" => { :vm_id => "server8", :ip => "192.168.56.208", :cpus => 3, :mem => 8192, :box => "ubuntu/focal64"}
}

Vagrant.configure("2") do |config|

  config.vagrant.plugins = ["vagrant-vbguest", "vagrant-hostmanager"]

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = false
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true
  config.vbguest.auto_update = true

  cluster.each_with_index do |(hostname, info), index|
    config.vm.define hostname do |cfg|
      cfg.vm.provider :virtualbox do |vb, override|

        config.vm.box = info[:box]
        config.vm.box_check_update = true
        override.vm.hostname = hostname
        override.vm.network :private_network, ip: "#{info[:ip]}"
        vb.customize ["modifyvm", :id, "--name", info[:vm_id]]
        vb.customize ["modifyvm", :id, "--memory", info[:mem], "--cpus", info[:cpus], "--hwvirtex", "on"]
        vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
        vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
        vb.customize ["modifyvm", :id, "--largepages", "on"]
        vb.customize ["modifyvm", :id, "--graphicscontroller", "vmsvga"]
        vb.customize ["modifyvm", :id, "--audio", "none"]
        vb.customize ["modifyvm", :id, "--usb", "off"]
        vb.customize ["modifyvm", :id, "--usbehci", "off"]
        vb.customize ["modifyvm", :id, "--nic2", "hostonly", "--cableconnected2", "on", "--hostonlyadapter2", "VirtualBox Host-Only Ethernet Adapter"]
        vb.customize ["modifyvm", :id, "--ioapic", "on"]
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]

      end
    end

    config.vm.provision :shell, path: "./bootstrap.sh"

  end
end
