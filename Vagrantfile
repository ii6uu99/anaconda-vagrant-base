Vagrant.configure("2") do |config|
  config.vm.provision "trigger" do |trigger|
    trigger.fire do
      if $?.exitstatus != 0
        # 使用するIPとポートを取得
        if @machine.provider_name == :virtualbox
          ip = `vagrant ssh #{@machine.name} -c "ip addr show dev eth1 | grep -w inet"`
               .match(/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/)[0]
          port = 22
        else
          ip = @machine.ssh_info[:host]
          port = @machine.ssh_info[:port]
        end
      end
    end
  end

  # 仮想マシンの設定
  # BoxはUbuntu 14.04
  config.vm.box = "ubuntu/trusty64"
  config.vm.provider :virtualbox do |vb|
    vb.customize [ 'modifyvm', :id, '--memory', 800 ]
  end
  config.vm.network "private_network", type: "dhcp"
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  # for postgres
  config.vm.network :forwarded_port, guest: 5432, host: 15432
  config.vm.network :private_network, ip: "192.168.33.10"

  # ubuntu
  config.vm.provision :shell, inline: "apt-get update"
  config.vm.provision :shell, inline: "apt-get -y upgrade"
  config.vm.provision :shell, inline: "apt-get -y install build-essential"

  # package install
  config.vm.provision :shell, inline: "apt-get -y install git"
  config.vm.provision :shell, inline: "chmod 755 /vagrant/anaconda-install.sh"
  #config.vm.provision :shell, inline: "/vagrant/anaconda-install.sh"

  # ssh
  config.ssh.forward_agent = true
end
