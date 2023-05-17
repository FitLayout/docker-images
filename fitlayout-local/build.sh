#!/bin/sh

#
# This script builds the fitlayout/fitlayout-server docker image.
#

mkdir app
cp ../PageView/package*.json ../PageView/*.js ../PageView/.eslintrc.cjs ../PageView/index.html app
cp -r ../PageView/src app
cp -r ../PageView/public app

# Create docker image
docker build -t fitlayout/fitlayout-local .

rm -rf app
