#!/bin/bash

git apply coremark.patch
docker build -f Dockerfile --build-arg UID=$(id -u) --build-arg GID=$(id -g) -t sw-docker:v1 .
clear
docker run -ti --privileged -v `realpath sw`:/workdir sw-docker:v1
