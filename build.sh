#!/bin/sh

. ./config.sh

# Remove any previous image
docker rmi $IMAGE_NAME

docker build -t $IMAGE_NAME .

echo "***********************************************************"
echo "***********************************************************"
echo "If everything has gone well you should be able to try :"
echo "- ./run_rai_wallet-from_docker.sh  <== to run from docker"
echo "***********************************************************"
echo "***********************************************************"
