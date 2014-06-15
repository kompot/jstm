# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.require_version '>= 1.6.3'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # config.vm.box = 'ubuntu14.04x64'
  # config.vm.box_url = 'http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'
  config.vm.box = 'ubuntu12.04x64'
  config.vm.box_url = 'http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box'

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', 512]
  end

  config.vm.provision 'salt' do |salt|
    salt.minion_key = 'salt/key/minion.pem'
    salt.minion_pub = 'salt/key/minion.pub'
    salt.verbose = true
  end

  config.vm.define 'uluwatu.jstm.local' do |v|
    v.vm.network :private_network, ip: '192.168.101.3'
    v.vm.hostname = 'uluwatu.jstm.local'
    v.vm.network :forwarded_port, guest: 80, host: 8999

    v.vm.synced_folder 'salt/srv-salt/', '/srv/'

    v.vm.provision :salt do |salt|
      salt.minion_key = 'salt/key/minion.pem'
      salt.minion_pub = 'salt/key/minion.pub'
      salt.install_master = true
      salt.minion_config = 'salt/minion-uluwatu'
      salt.master_config = 'salt/master'
      salt.master_key = 'salt/key/master.pem'
      salt.master_pub = 'salt/key/master.pub'
      salt.seed_master = {minion: salt.minion_pub}
      # salt.run_overstate = true
    end
  end

  config.vm.define 'kuta.jstm.local' do |v|
    v.vm.hostname = 'kuta.jstm.local'
    v.vm.network :private_network, ip: '192.168.101.2'
    v.vm.synced_folder '.', '/home/vagrant/app/'

    v.vm.provision :salt do |salt|
      salt.minion_config = 'salt/minion-kuta'
    end
  end

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

end
