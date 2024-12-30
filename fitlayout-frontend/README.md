FitLayout/2 - Web Frontend App
==============================

(c) 2015-2024 Radek Burget (burgetr@fit.vutbr.cz)

This image provides a docker image with the [PageView frontent app](https://github.com/FitLayout/PageView) which provides a web GUI for the FitLayout server.

## Requirements

Docker must be installed on your system to use the docker images.

## Usage

Normally, this image is a part of the complete server configuration as provided in the [docker-compose](https://github.com/FitLayout/docker-images/tree/main/docker-compose) folder.

## Standalone client app usage

The frontend can be used separately as a standalone client app for a remote [FitLayout server](https://github.com/FitLayout/docker-images/tree/main/fitlayout-server). The `client.sh` script can be used for this purpose:

Download the [client.sh](https://github.com/FitLayout/docker-images/blob/main/fitlayout-frontend/client.sh) script from GitHub:

```bash
wget https://raw.githubusercontent.com/FitLayout/docker-images/refs/heads/main/fitlayout-frontend/client.sh
chmod 755 client.sh
```

Then run the script with a remote server URL as a parameter, e.g.:

```bash
./client.sh http://testing.server.com:8400
```

**Note:** Do not add a path to the server URL, the paths will be propagated transparently by the local server provided by the docker image.

After the local server is started, point your server to `http://localhost:8440`.
