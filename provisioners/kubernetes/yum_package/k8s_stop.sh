#!/bin/bash

set -ex

# etcd
systemctl stop etcd.service

# master
systemctl stop kube-apiserver.service
systemctl stop kube-controller-manager.service
systemctl stop kube-scheduler.service

# node
systemctl stop kube-proxy.service
systemctl stop kubelet.service

# flannel
systemctl stop flanneld.service

echo "k8s stopped."