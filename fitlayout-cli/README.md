FitLayout/2 - CLI Docker Image
==============================

(c) 2015-2021 Radek Burget (burgetr@fit.vutbr.cz)

This image provides a docker image with the [command-line interface](https://github.com/FitLayout/FitLayout/wiki/Command-line-Interface).

## Requirements

Docker must be installed on your system to use the docker images.

## Configuration

Download the [fitlayout.sh](https://github.com/FitLayout/docker-images/blob/main/fitlayout-cli/fitlayout.sh) script from GitHub:

```bash
wget https://raw.githubusercontent.com/FitLayout/docker-images/main/fitlayout-cli/fitlayout.sh
chmod 755 fitlayout.sh
```

Optionally, you may want to edit the `fitlayout.sh` file for changing the location of the following folders:

- `STORAGE_PATH` - the folder where the local RDF repository lives. If an empty folder is provided, a new repository will be initialized. It is set to `/opt/fitlayout/storage` by default.
- `OUTPUT_FOLDER` - the folder used for storing the output produced by the `EXPORT` command. Within the container, this folder is referenced as `/out` (i.e. use for example `EXPORT -f xml -o /out/file.xml` for exporting a XML file (see a complete example below).

## Usage

Run fitlayout CLI using

```bash
./fitlayout.sh [<commands>]
```

For example:

```bash
./fitlayout.sh \
    RENDER -b puppeteer http://cssbox.sf.net \
    SEGMENT -m vips -O pDoC=9 \
    EXPORT -f xml -o /out/file.xml
```

On first run, the related docker images will be pulled which may take some time.

See the [command-line interface documentation](https://github.com/FitLayout/FitLayout/wiki/Command-line-Interface) for a complete command reference and examples.
