#! /bin/sh

CONTAINER_NAME=auth-server
IMAGE_NAME=fitlayout/fitlayout-auth-server

docker rm -f $CONTAINER_NAME
docker run -d -p 8480:8080 \
    --restart unless-stopped \
    --name $CONTAINER_NAME \
    --mount 'source=authstorage,target=/opt/storage' \
    --volume /opt/shared/fitlayout-auth-server:/opt/shared \
    --volume /opt/config/fitlayout-auth-server:/opt/config \
    $IMAGE_NAME
