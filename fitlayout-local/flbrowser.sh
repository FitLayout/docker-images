#!/bin/sh

# EDIT: Location of the artifact RDF storage
STORAGE_PATH="$HOME/.fitlayout/storage"

# EDIT: An optional folder with browser extensions to be used for rendering
EXT_FOLDER="/opt/config/browser-extensions"

if [ ! $# -eq 0 ]; then 
    STORAGE_PATH="$1"
fi

# Check the folders
if [ ! -d "$STORAGE_PATH" ]; then
        mkdir -p "$STORAGE_PATH"
fi

# Mount the extensions folder if present
EXT=""
if [ -d "$EXT_FOLDER" ]; then
	EXT="--mount type=bind,source=$EXT_FOLDER,target=/opt/fitlayout-puppeteer/extensions"
fi

echo "Browsing artifact storage in $STORAGE_PATH";
echo "Starting the local server. After the server is started please point your server to"
echo "http://localhost:8099"

# Run the image
docker run --rm \
  -p 127.0.0.1:8099:80/tcp \
  --mount type=bind,source="$STORAGE_PATH",target=/opt/storage/storage-cli \
  fitlayout/fitlayout-local 2>&1 | grep 'ready in' | sed 's/.*/Server started./g'
