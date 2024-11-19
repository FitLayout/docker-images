#!/bin/sh
# Runs the fitlayout-frontend image in the background
docker rm -f fitlayout-frontend || true && docker run -d -p 8440:80 --restart unless-stopped --name fitlayout-frontend fitlayout/fitlayout-frontend
