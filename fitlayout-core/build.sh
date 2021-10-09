#!/bin/sh

#
# This script builds the fitlayout/fitlayout-core docker image.
#

WD="`pwd`"
mkdir files

# Prepare files for build
cp -r ../FitLayout files
cp -r ../FitLayoutWeb files
cp ../fitlayout-puppeteer/index.js files
cp ../fitlayout-puppeteer/package*.json files

# Create docker image
docker build -t fitlayout/fitlayout-core .

# Clean up
rm -rf files
