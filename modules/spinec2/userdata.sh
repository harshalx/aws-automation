#!/bin/bash

#remove older versions of docker just in case
sudo yum remove docker \
                  docker-common \
                  docker-selinux \
                  docker-engine

#install docker-ce pre-requisites
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

#docker-ce needs container-selinux .. install it
rpm -ivh http://mirror.centos.org/centos/7/extras/x86_64/Packages/container-selinux-2.33-1.git86f33cd.el7.noarch.rpm

#install the docker-ce repo
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo


#install docker-ce latest version
sudo yum install -y docker-ce

#start the docker service 
sudo service docker restart 

#install the localz-hapiness container
docker run -d -p 8000:8000 localz/happiness-service


