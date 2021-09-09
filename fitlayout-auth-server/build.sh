#! /bin/sh

SOURCE=../jwt-auth-microservice

mkdir app
cp -r $SOURCE/src app
cp $SOURCE/.classpath $SOURCE/pom.xml app

docker build -t fitlayout/fitlayout-auth-server .

rm -rf app
