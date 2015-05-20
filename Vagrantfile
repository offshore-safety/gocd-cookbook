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
      chef.json = {
        'java' => {
          'jdk' => {
            '8' => {
              'x86_64' => {
                'url' => 'https://s3-ap-southeast-2.amazonaws.com/chefstuff-sydney.dev/jdk-8u45-linux-x64.tar.gz',
                'checksum' => 'f298ca9239051dfddf8642fcc9e264f7fe5af10adb67027feb3a0ed0a1a2316d'
              }
            }
          }
        }
      }

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
        'java' => {
          'jdk' => {
            '8' => {
              'x86_64' => {
                'url' => 'https://s3-ap-southeast-2.amazonaws.com/chefstuff-sydney.dev/jdk-8u45-linux-x64.tar.gz',
                'checksum' => 'f298ca9239051dfddf8642fcc9e264f7fe5af10adb67027feb3a0ed0a1a2316d'
              }
            }
          }
        },
        'gocd' => {
          'server' => {
            'host' => '172.28.128.10'
          },
          'agent' => {
            'resources' => [
              'oraclejdk8'
            ]
          }
        }
      }

      chef.run_list = [
        'recipe[gocd::agent]'
      ]
    end
  end

  config.vm.define :go_agent_with_jdks_on_agent do |agent|
    agent.vm.hostname = 'gocd-agent'
    agent.vm.provider :virtualbox do |vb|
      vb.memory = 1024
    end
    agent.vm.network :private_network, ip: '172.28.128.11'

    agent.vm.provision :chef_solo do |chef|
      chef.json = {
        'java' => {
          'jdk' => {
            '8' => {
              'x86_64' => {
                'url' => 'https://s3-ap-southeast-2.amazonaws.com/chefstuff-sydney.dev/jdk-8u45-linux-x64.tar.gz',
                'checksum' => 'f298ca9239051dfddf8642fcc9e264f7fe5af10adb67027feb3a0ed0a1a2316d'
              }
            },
            '7' => {
              'x86_64' => {
                'url' => 'https://s3-ap-southeast-2.amazonaws.com/chefstuff-sydney.dev/jdk-7u80-linux-x64.tar.gz',
                'checksum' => 'bad9a731639655118740bee119139c1ed019737ec802a630dd7ad7aab4309623'
              }
            }
          }
        },
        'gocd' => {
          'version' => '15.2.0-1936',
          'server' => {
            'host' => '172.28.128.10'
          },
          'agent' => {
            'resources' => [
              'openjdk7',
              'openjdk8',
              'oraclejdk7',
              'oraclejdk8'
            ]
          }
        }
      }

      chef.run_list = [
        'recipe[gocd::openjdk7]',
        'recipe[gocd::openjdk8]',
        'recipe[gocd:oracle_jdk7]',
        'recipe[gocd::agent]'
      ]
    end
  end

  # Enabling the Berkshelf plugin. To enable this globally, add this configuration
  # option to your ~/.vagrant.d/Vagrantfile file
  config.berkshelf.enabled = true
end
