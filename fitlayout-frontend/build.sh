#! /bin/sh

mkdir app
cp ../PageView/package*.json ../PageView/*.js ../PageView/.eslintrc.cjs ../PageView/index.html app
cp -r ../PageView/src app
cp -r ../PageView/public app

docker build -t fitlayout/fitlayout-frontend .

rm -rf app
