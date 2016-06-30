#!/bin/bash

set -ex

# start docker engine
systemctl start docker.service

# If you’d like to use the current stable version of Kubernetes, run the following:
# export K8S_VERSION=$(curl -sS https://storage.googleapis.com/kubernetes-release/release/stable.txt)
# and for the latest available version (including unstable releases):
# export K8S_VERSION=$(curl -sS https://storage.googleapis.com/kubernetes-release/release/latest.txt)
export K8S_VERSION=v1.3.0-beta.2

# http://kubernetes.io/docs/getting-started-guides/docker/
#   search command: docker search gcr.io/google_containers 
#   tagl list command: curl https://gcr.io/v2/google-containers/hyperkube/tags/list
export ARCH=amd64
docker run -d \
    --volume=/:/rootfs:ro \
    --volume=/sys:/sys:rw \
    --volume=/var/lib/docker/:/var/lib/docker:rw \
    --volume=/var/lib/kubelet/:/var/lib/kubelet:rw \
    --volume=/var/run:/var/run:rw \
    --net=host \
    --pid=host \
    --privileged \
    gcr.io/google_containers/hyperkube-${ARCH}:${K8S_VERSION} \
    /hyperkube kubelet \
        --containerized \
        --hostname-override=127.0.0.1 \
        --api-servers=http://localhost:8080 \
        --config=/etc/kubernetes/manifests \
        --cluster-dns=10.0.0.10 \
        --cluster-domain=cluster.local \
        --allow-privileged --v=2

# curl -sSL "http://storage.googleapis.com/kubernetes-release/release/${K8S_VERSION}/bin/linux/${ARCH}/kubectl" > /usr/bin/kubectl
# chmod +x /usr/bin/kubectl

# kubectl config set-cluster test-doc --server=http://localhost:8080
# kubectl config set-context test-doc --cluster=test-doc
# kubectl config use-context test-doc

