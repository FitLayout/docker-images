#!/bin/sh

#
# This script builds the fitlayout/fitlayout-server docker image.
#

# Create docker image
docker build -t fitlayout/fitlayout-cli .
