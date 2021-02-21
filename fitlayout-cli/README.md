FitLayout/2 - CLI Docker Image
==============================

(c) 2015-2021 Radek Burget (burgetr@fit.vutbr.cz)

This image provides a docker image with the [command-line interface](https://github.com/FitLayout/FitLayout/wiki/Command-line-Interface).

## Requirements

Docker must be installed on your system to use the docker images.

## Configuration and usage

Download the [fitlayout.sh](https://github.com/FitLayout/docker-images/blob/main/fitlayout-cli/fitlayout.sh) script from GitHub:

```bash
wget https://raw.githubusercontent.com/FitLayout/docker-images/main/fitlayout-cli/fitlayout.sh
chmod 755 fitlayout.sh
```

Then, run fitlayout CLI using

```bash
./fitlayout.sh [<commands>]
```

For the first time, the related docker images will be downloaded which may take some time.

See the [command-line interface documentation](https://github.com/FitLayout/FitLayout/wiki/Command-line-Interface) for the commands reference and examples.
