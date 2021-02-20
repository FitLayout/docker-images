#!/bin/sh

# EDIT: Location of the artifact RDF storage
STORAGE_PATH="/opt/fitlayout/storage"

# EDIT: Output folder location for storing the EXPORT command results
OUTPUT_FOLDER="$PWD"

# Run the image
docker run -it \
  --mount type=bind,source="$STORAGE_PATH",target=/opt/storage \
  --mount type=bind,source="$OUTPUT_FOLDER",target=/out \
  fitlayout/fitlayout-cli $@
