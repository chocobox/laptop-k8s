#!/bin/bash

set -ex

basedir=`cd $(dirname ${0}) && pwd`

yum -y install epel-release

# docker engine
yum -y install docker
systemctl enable docker.service
cp ${basedir}/configs/etc/sysconfig/docker /etc/sysconfig/docker
chmod 644 /etc/sysconfig/docker

# docker registry
yum -y install docker-registry python-sqlalchemy
systemctl enable docker-registry.service
cp ${basedir}/configs/etc/sysconfig/docker-registry /etc/sysconfig/docker-registry
cp ${basedir}/configs/etc/docker-registry.yml /etc/docker-registry.yml
chmod 644 /etc/sysconfig/docker-registry
chmod 644 /etc/docker-registry.yml

# docker compose
curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
