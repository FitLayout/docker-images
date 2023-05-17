#!/bin/sh
set -e

KEYDIR=/opt/jwt-keys
PUBDIR=/opt/shared

if [ ! -d "$KEYDIR" ]; then
    mkdir $KEYDIR
    echo "Re-generating keys in $KEYDIR"
    openssl genrsa -out $KEYDIR/baseKey.pem
    openssl pkcs8 -topk8 -inform PEM -in $KEYDIR/baseKey.pem -out $KEYDIR/privateKey.pem -nocrypt
    openssl rsa -in $KEYDIR/baseKey.pem -pubout -outform PEM -out $KEYDIR/publicKey.pem
fi

[ -d "$PUBDIR" ] && cp "$KEYDIR/publicKey.pem" "$PUBDIR/"

exec java -XX:MaxRAMPercentage=${MEM_MAX_RAM_PERCENTAGE} -Xss${MEM_XSS} -XX:+UseContainerSupport ${JVM_ARGS} -jar payara-micro.jar "$@"
