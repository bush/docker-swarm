eval $(docker-machine env manager1)
#docker network create --driver overlay coke                                                                            
docker service create --name cokeapp --constraint='node.labels.tenant == coke' --network coke --replicas 4 jwilder/whoami
