eval $(docker-machine env manager1)
#docker network create --driver overlay pepsi                                                                            
docker service create --name pepsiapp --constraint='node.labels.tenant == pepsi' --network pepsi --replicas 4 jwilder/whoami
