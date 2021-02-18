#!/bin/sh

#
# This script builds the fitlayout/fitlayout-server docker image.
#

WD="`pwd`"
mkdir files

# Build FitLayout core
cd ../FitLayout
cd lib
./install.sh
cd ..
mvn -DskipTests clean install

# Build FitLayout web API
cd ../FitLayoutWeb/FitLayoutWebService
mvn clean package && mvn payara-micro:bundle

# Check the result
cd "$WD"
if [ ! -f ../FitLayout/fitlayout-tools/target/FitLayout.jar ]; then
    echo "BUILD FAILED - FitLayout.jar missing"
    exit 1
fi
cp ../FitLayout/fitlayout-tools/target/FitLayout.jar files

if [ ! -f ../FitLayoutWeb/FitLayoutWebService/target/fitlayout-web-microbundle.jar ]; then
    echo "BUILD FAILED - fitlayout-web-microbundle missing"
    exit 1
fi
cp ../FitLayoutWeb/FitLayoutWebService/target/fitlayout-web-microbundle.jar files

# Copy puppeteer-backend files
cp ../fitlayout-puppeteer/index.js files
cp ../fitlayout-puppeteer/package*.json files

# Create docker image
docker build -t fitlayout/fitlayout-core .

# Clean up
rm -rf files
