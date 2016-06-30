#!/bin/bash

set -ex

# etcd
systemctl enable etcd.service

# master
systemctl enable kube-apiserver.service
systemctl enable kube-controller-manager.service
systemctl enable kube-scheduler.service

# node
systemctl enable kube-proxy.service
systemctl enable kubelet.service

# flannel
systemctl enable flanneld.service

echo "k8s enabled."