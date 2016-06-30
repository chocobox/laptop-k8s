#!/bin/bash

set -ex

# etcd
systemctl disable etcd.service

# master
systemctl disable kube-apiserver.service
systemctl disable kube-controller-manager.service
systemctl disable kube-scheduler.service

# node
systemctl disable kube-proxy.service
systemctl disable kubelet.service

# flannel
systemctl disable flanneld.service

echo "k8s disabled."