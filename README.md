laptop-k8s
---

# PLATFORM
CentOS7 minimal


# PACKAGES
- docker  
- docker-compose  


# HOW TO USE

## build
packer build template.json  

## launch
vagrant up
sh /var/provisioners/kubernetes/start.sh

## login
vagrant ssh

## delete
vagrant destroy


# TROUBLE SHOOTING

## vagrant can't mount dir of localmachine when vagrant up

```
vagrant plugin install vagrant-vbguest
```

if you got the following messages when vagrant up, you should install vagrant-vbguest to solve it.

```
==> default: Mounting shared folders...
    default: /vagrant => C:/Users/masahiro_honma/Desktop/codes/cd/laptop-k8s
Failed to mount folders in Linux guest. This is usually because
the "vboxsf" file system is not available. Please verify that
the guest additions are properly installed in the guest and
can work properly. The command attempted was:

mount -t vboxsf -o uid=`id -u vagrant`,gid=`getent group vagrant | cut -d: -f3` vagrant /vagrant
mount -t vboxsf -o uid=`id -u vagrant`,gid=`id -g vagrant` vagrant /vagrant

The error output from the last command was:

mount: unknown filesystem type 'vboxsf'

```