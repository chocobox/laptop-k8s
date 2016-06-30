#!/bin/bash

set -ex

basedir=`cd $(dirname ${0}) && pwd`

curl -sSL "http://storage.googleapis.com/kubernetes-release/release/${K8S_VERSION}/bin/linux/${ARCH}/kubectl" > /usr/bin/kubectl
chmod +x /usr/bin/kubectl

kubectl config set-cluster test-doc --server=http://localhost:8080
kubectl config set-context test-doc --cluster=test-doc
kubectl config use-context test-doc

ln -s ${basedir}/kubestart.sh /usr/bin/kubestart
ln -s ${basedir}/kubestop.sh /usr/bin/kubestop

chmod +x /usr/bin/kubestart
chmod +x /usr/bin/kubestop