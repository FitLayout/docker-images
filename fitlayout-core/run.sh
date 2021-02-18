#!/bin/sh

# Run the image
docker rm -f fitlayout-server || true && docker run -d -p 8400:8400 --mount 'source=flstorage,target=/opt/storage' --name fitlayout-server --restart unless-stopped fitlayout/fitlayout-server 
