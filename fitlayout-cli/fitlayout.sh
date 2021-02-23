#!/bin/sh

# EDIT: Location of the artifact RDF storage
STORAGE_PATH="/opt/fitlayout/storage"

# EDIT: Output folder location for storing the EXPORT command results
OUTPUT_FOLDER="$PWD"

# Check the folders
if [ ! -d "$STORAGE_PATH" ]; then
        mkdir -p "$STORAGE_PATH"
fi
if [ ! -d "$OUTPUT_FOLDER" ]; then
        mkdir -p "$OUTPUT_FOLDER"
fi

# Run the image
docker run \
  --mount type=bind,source="$STORAGE_PATH",target=/opt/storage \
  --mount type=bind,source="$OUTPUT_FOLDER",target=/out \
  fitlayout/fitlayout-cli $@
