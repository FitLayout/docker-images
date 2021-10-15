#!/bin/bash

# RUN ME AS ROOT (sudo)

# This script initializes the configuration file structure in /opt that
# is used by different containers.

# Current structure:
# /opt
#   /config
#     /fitlayout-server
#       config.properties # server additional properties (optional)
#     /fitlayout-auth-server
#       microprofile-config.properties # auth server properties
#   /shared
#     /fitlayout-auth-server  # for shared keys

if [ ! `whoami` = "root" ]; then
    echo "Run me with sudo!"
    exit 1
fi

WD=`dirname "$0"`
CONF="$WD/config-samples"

mkdir /opt/config
chmod a+rx /opt/config

mkdir /opt/config/fitlayout-server
chmod a+rx /opt/config/fitlayout-server
cp "$CONF/server-config.properties" /opt/config/fitlayout-server/config.properties
chmod a+r /opt/config/fitlayout-server/config.properties

mkdir /opt/config/fitlayout-auth-server
chmod a+rx /opt/config/fitlayout-server
cp "$CONF/auth-server-config.properties" /opt/config/fitlayout-auth-server/microprofile-config.properties
chmod a+r /opt/config/fitlayout-auth-server/microprofile-config.properties

mkdir /opt/shared
chmod a+rx /opt/shared
mkdir /opt/shared/fitlayout-auth-server
chmod a+rx /opt/shared/fitlayout-auth-server

echo "Done."
echo "Please review the configuration files in /opt/config before running the containers."
