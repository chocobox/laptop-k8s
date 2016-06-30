#!/bin/bash

set -ex

docker rm -f $(docker ps -aq)