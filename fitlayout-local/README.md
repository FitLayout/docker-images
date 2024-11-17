FitLayout/2 - Local Server Docker Image
=======================================

(c) 2022 Radek Burget (burgetr@fit.vutbr.cz)

This image provides the [FitLayout Server backend](https://github.com/FitLayout/FitLayoutWeb) together with the [PageView frontend](https://github.com/FitLayout/PageView) running in a signle container that can be used for browsing local artifact repositories.

## Requirements

Docker must be installed on your system to use the docker images.

## Configuration

Download the [flbrowser.sh](https://github.com/FitLayout/docker-images/blob/main/fitlayout-local/flbrowser.sh) script from GitHub:

```bash
wget https://raw.githubusercontent.com/FitLayout/docker-images/main/fitlayout-local/flbrowser.sh
chmod 755 flbrowser.sh
```

## Usage

Run the local browser using

```bash
./flbrowser.sh [<repository path>]
```

where the *repository path* is the path to the local RDF repository that will be used by the browser. When no path is provided, the
browser will try to use the path provided in the `FL_STORAGE` environment variable. If not set, the default repository in
`$HOME/.fitlayout/storage` will be used.

On first run, the related docker images will be pulled which may take some time.
