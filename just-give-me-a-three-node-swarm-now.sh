#!/bin/bash
MANAGER=manager1
WORKER1=worker1
WORKER2=worker2
BOOT2DOCKERISO='--virtualbox-boot2docker-url https://github.com/boot2docker/boot2docker/releases/download/v1.12.6/boot2docker.iso'

docker-machine create -d virtualbox --virtualbox-host-dns-resolver $BOOT2DOCKERISO $MANAGER
docker-machine create -d virtualbox --virtualbox-host-dns-resolver $BOOT2DOCKERISO $WORKER1
docker-machine create -d virtualbox --virtualbox-host-dns-resolver $BOOT2DOCKERISO $WORKER2
eval $(docker-machine env $MANAGER)
MANAGER_IP=$(docker-machine ip $MANAGER)
docker swarm init --advertise-addr $MANAGER_IP 
JOIN_TOKEN=$(docker swarm join-token -q worker)
MANAGER_URL=$MANAGER_IP:2377
eval $(docker-machine env $WORKER1)
docker swarm join --token $JOIN_TOKEN $MANAGER_URL
eval $(docker-machine env $WORKER2)
docker swarm join --token $JOIN_TOKEN $MANAGER_URL
eval $(docker-machine env $MANAGER)
docker node ls
