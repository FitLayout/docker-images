#!/bin/sh
# Runs the fitlayout-frontend image in the foreground and optionaly sets a proxy

# EDIT Change the port if necessary
PORT="8440"

# The target should be specified without any path to make nginx proxy_pass
# work transparently (and not decode the artifact uris in urls)
API_TARGET="http://localhost:8400"

if [ ! $# -eq 0 ]; then 
    API_TARGET="$1"
fi

ENVOPTS="--env API_PATH=/api/ --env SERVER_PROXY=\"$API_TARGET\""

echo "##################################################################################"
echo "Target server: $API_TARGET"
echo "Starting the local server. After the server is started please point your server to"
echo "http://localhost:$PORT"
echo "##################################################################################"

docker run --rm $ENVOPTS \
    -p $PORT:80 \
    fitlayout/fitlayout-frontend
