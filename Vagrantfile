# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.require_version '>= 1.5.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = 'chef/centos-7.0'

  config.vm.define :go_server, primary: true do |server|
    server.vm.hostname = 'gocd-server'
    server.vm.provider :virtualbox do |vb|
      vb.memory = 1024
    end
    server.vm.network :private_network, ip: '172.28.128.10'

    server.vm.provision :chef_solo do |chef|
      chef.json = {}

      chef.run_list = [
        'recipe[gocd::server]'
      ]
    end


    server.vm.network "forwarded_port", guest: 8153, host: 8153
  end

  config.vm.define :go_agent do |agent|
    agent.vm.hostname = 'gocd-agent'
    agent.vm.provider :virtualbox do |vb|
      vb.memory = 1024
    end
    agent.vm.network :private_network, ip: '172.28.128.11'

    agent.vm.provision :chef_solo do |chef|
      chef.json = {
        'gocd' => {
          'server' => {
            'host' => '172.28.128.10'
          }
        }
      }

      chef.run_list = [
        'recipe[gocd::agent]'
      ]
    end
  end

  config.vm.define :go_agent_with_ivdev do |agent|
    agent.vm.hostname = 'gocd-agent-java'
    agent.vm.provider :virtualbox do |vb|
      vb.memory = 1024
    end
    agent.vm.network :private_network, ip: '172.28.128.13'

    agent.vm.provision :chef_solo do |chef|
      chef.json = {
        'gocd' => {
          'server' => {
            'host' => '172.28.128.10'
          },
          'agent' => {
            'resources' => ['ivdev']
          }
        }
      }

      chef.run_list = [
        'recipe[gocd::agent]'
      ]
    end
  end

  # Enabling the Berkshelf plugin. To enable this globally, add this configuration
  # option to your ~/.vagrant.d/Vagrantfile file
  config.berkshelf.enabled = true
end
