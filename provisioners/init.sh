#!/bin/bash

yum -y update

yum -y install git

systemctl stop firewalld
systemctl disable firewalld

ln -sf /dev/null /etc/udev/rules.d/70-persistent-net.rules

# install vboxguest
#yum -y install tar bzip2 gcc make kernel-devel
#mount -t iso9660 -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt
#sh /mnt/VBoxLinuxAdditions.run
#rm -rf /home/vagrant/VBoxGuestAdditions.iso