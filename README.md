# RAI_WALLET (Docker Container)

## Goal

Provide an easy way (not too hard) for GNU Linux users to run the (RaiBlocks)[https://raiblocks.net/]'s Wallet.


## Prerequisite

The wallet will be executed within a docker container. For this reason, you will have to install it on your distribution.


### Installing Docker

- On recent Ubuntu version, you should be able to install it by symply typing in a terminal :

`sudo apt-get install docker.io`

- If this doesn't works, pleas refer to the (official documentation of Docker)[https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/] to install it.


### Autorization for docker containers to connect to your X Server

In a terminal, allow connections from the docker container to your X Server by typing in a terminal :

`xhost local:root`

### Allow your user to interact with docker

`sudo adduser $USER docker`


## Build the Docker Image

Simply run `./build.sh` in a terminal (the whole process can take some time (from 15 minutes to a few hours depending on your Internet connection and Computer CPU))

## Usage

`./run_rai_wallet-from_docker.sh`


# raiwallet_docker_container
