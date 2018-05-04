# docker-iobroker
[![Downloads](https://img.shields.io/docker/pulls/angelnu/iobroker.svg)](https://hub.docker.com/r/angelnu/iobroker/)
[![Build Status](https://travis-ci.org/angelnu/docker-iobroker.svg?branch=master)](https://travis-ci.org/angelnu/docker-iobroker)

iobroker as docker container for [mutiple archs](https://hub.docker.com/r/angelnu/iobroker/tags):
- arm
- arm64
- amd64

## How to run
### Docker
```
docker run -d <any port you want to open> angelnu/iobroker
```
### Kubernetes
See [example](kubernetes.yaml)


## Travis
Note: if you clone this you need to set your travis env variables:

- `travis env set DOCKER_USER <your docker user>`
- `travis env set DOCKER_PASS <your docker password>`
