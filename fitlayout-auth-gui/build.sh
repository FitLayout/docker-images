#! /bin/sh

mkdir app
cp ../AuthGUI/package*.json ../AuthGUI/*.js ../AuthGUI/.eslintrc.js app
cp -r ../AuthGUI/src app
cp -r ../AuthGUI/public app

docker build -t fitlayout/fitlayout-auth-gui .

rm -rf app
