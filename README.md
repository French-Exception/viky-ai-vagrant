# About

Simply curious about new NLP project from Pertimm ? Let's try out !

This is a single-vm Vagrantfile.

Next step is to use Docker Swarm to run the docker-compose.

You can configure many parameters (cpus, memory, etc.)

# Requirements

You need 
- Vagrant 2.2.6  (https://www.vagrantup.com/downloads.html)
- VirtualBox 5.0.14 (https://www.virtualbox.org/wiki/Downloads)
- Git 2.24 (https://git-scm.com/downloads)

# Installation (Git)
## Cloning

```bash
git clone git@github.com:French-Exception/viky-ai-vagrant.git
cd viky-ai-vagrant
```

## Set up
During setup phase you can configure different parameters.

For now using simple files to store values (.vm_*).
```bash
# Available vars (defaults) :
# vm_default_vm_box=${vm_default_vm_box:="debian/contrib-buster64"}
# vm_default_vm_memory=${vm_default_vm_memory:=2048}
# vm_default_vm_cpus=${vm_default_vm_cpus:=2}
# vm_default_apt_proxy=${vm_default_apt_proxy:=""}
# vm_default_ssh_port=${vm_default_ssh_port:="1234"}
# vm_default_private_net_ip=${vm_default_private_net_ip:="192.168.53.2"}

# Usage example :
vm_default_vm_memory=4096 vm_default_vm_cpus=4 ./.dev/setup.sh
```

This will brings up a new VM and will install current Viky-Ai git HEAD.

Check ```.dev/restart.sh``` to see workflow. 

```/vagrant``` will be mounted as your current directory (where the Vagrantfile lives).

## Create VM

This will create a new VM using Vagrant.

It will stage the process to save intermediate states so you can easily restart process on failure.

```bash
./.dev/start.sh
```
## Recreate VM

```bash
./.dev/restart.sh
```

# Packaging VM
```bash
vagrant package default
```

