# How Create a Three Node Swarm Using docker-machine

## Prerequisites

Install docker-machine

The official installation instructions are [here](https://docs.docker.com/machine/install-machine/) but it you want to just install docker-machine run this:
```
curl -L https://github.com/docker/machine/releases/download/v0.10.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
  chmod +x /tmp/docker-machine &&
  sudo cp /tmp/docker-machine /usr/local/bin/docker-machine
```

Install the latest version of virtualbox.  You can follow these instructions [here](https://tecadmin.net/install-oracle-virtualbox-on-ubuntu/).

## Run the script
`./just-give-me-a-three-node-swarm-now.sh`

## Try it out
```
docker-machine use manager1
docker node ls
```

or

```
docker-machine ssh manager1
docker node ls
```

Enjoy!
