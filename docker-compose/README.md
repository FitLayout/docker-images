FitLayout/2 - Docker Compose
============================

(c) 2015-2021 Radek Burget (burgetr@fit.vutbr.cz)

This docker compose bundle consists of the following images:

* fitlayout/fitlayout-server
* fitlayout/fitlayout-frontend
* fitlayout/fitlayout-auth-server
* fitlayout/fitlayout-auth-gui

Dependencies:

* fitlayout/fitlayout-core

## Installation

1. Clone repository and update submodules

```bash
git clone https://github.com/FitLayout/docker-images.git
cd docker-images
git submodule update --init
cd docker-compose
```

2. Prepare auth-server configuration

```bash
mkdir -p /opt/config/fitlayout-auth-server
cp ../jwt-auth-microservice/src/main/resources/META-INF/microprofile-config.properties.example /opt/config/fitlayout-auth-server/microprofile-config.properties
```

3. Build images locally (Optional, if you skip this step, the images will be pulled from Docker Hub)

```bash
./build-all.sh --with-core
```

4. Initialize Let's Encrypt

```bash
./init-letsencrypt.sh
```

5. Start-up the containers 

```bash
docker-compose up
```
