#!/usr/bin/env bash
set -x

vm_default_vm_box=${vm_default_vm_box:="debian/contrib-buster64"}
vm_default_vm_memory=${vm_default_vm_memory:=2048}
vm_default_vm_cpus=${vm_default_vm_cpus:=2}
vm_default_apt_proxy=${vm_default_apt_proxy:=""}
vm_default_ssh_port=${vm_default_ssh_port:="1234"}
vm_default_private_net_ip=${vm_default_private_net_ip:="192.168.53.2"}

echo "${vm_default_vm_box}" > .vm_default_vm_box
echo "${vm_default_vm_cpus}" > .vm_default_vm_cpus
echo "${vm_default_vm_memory}" > .vm_default_vm_memory
echo "${vm_default_apt_proxy}" > .vm_default_apt_proxy
echo "${vm_default_ssh_port}" > .vm_default_ssh_port
echo "${vm_default_private_net_ip}" > .vm_default_private_net_ip


