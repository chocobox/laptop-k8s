#!/bin/bash

set -ex

# etcd
systemctl start etcd.service

# master
systemctl start kube-apiserver.service
systemctl start kube-controller-manager.service
systemctl start kube-scheduler.service

# node
systemctl start kube-proxy.service
systemctl start kubelet.service

# flannel
systemctl start flanneld.service

echo "k8s started."