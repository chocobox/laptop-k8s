#!/bin/bash

set -ex

basedir=`cd $(dirname ${0}) && pwd`

# etcd
yum -y install etcd
cp ${basedir}/configs/etc/etcd/etcd.conf /etc/etcd/etcd.conf
#systemctl enable etcd.service
systemctl start etcd.service

# network settings for flannel
curl -L http://localhost:4001/v2/keys/coreos.com/network/config \
     -XPUT --data-urlencode value@${basedir}/flannel-config.json

# master
yum -y install kubernetes-master
cp ${basedir}/configs/etc/kubernetes/config /etc/kubernetes/config
cp ${basedir}/configs/etc/kubernetes/apiserver /etc/kubernetes/apiserver
cp ${basedir}/configs/etc/kubernetes/controller-manager /etc/kubernetes/controller-manager
#systemctl enable kube-apiserver.service
#systemctl enable kube-controller-manager.service
#systemctl enable kube-scheduler.service

# node
yum -y install kubernetes-node
cp ${basedir}/configs/etc/kubernetes/kubelet /etc/kubernetes/kubelet
#systemctl enable kube-proxy.service
#systemctl enable kubelet.service

# flannel
yum -y install flannel
#systemctl enable flanneld.service
cp ${basedir}/configs/etc/sysconfig/flanneld /etc/sysconfig/flanneld
