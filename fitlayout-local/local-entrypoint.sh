#! /bin/bash

# Default config file contained in the image
DEF_CONF="${DEPLOYMENT_DIR}/config-local.properties"
# Optional user properties mounted from outside
OPT_CONF="/opt/config/config.properties"
# Final properties used for the server
RUN_CONF="${DEPLOYMENT_DIR}/config-run-local.properties"

if [ -f $OPT_CONF ]; then
    cat $DEF_CONF $OPT_CONF >$RUN_CONF
else
    cat $DEF_CONF >$RUN_CONF
fi

service nginx start
exec java -jar ${BUNDLE} --port ${PORT} --systemproperties $RUN_CONF
