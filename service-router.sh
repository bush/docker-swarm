eval $(docker-machine env manager1)
#docker network create --driver overlay coke                                                                            
docker service create --name service-router --network coke --network pepsi --replicas 4 jwilder/whoami
