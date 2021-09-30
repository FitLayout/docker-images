FitLayout/2 - Docker Images
===========================

(c) 2015-2021 Radek Burget (burgetr@fit.vutbr.cz)

This repository contains docker files for the individual FitLayout components. The following docker images are provided:

- [fitlayout-core](https://github.com/FitLayout/docker-images/tree/main/fitlayout-core) configured core framework and the rendering backends used by the remaining images.
- [fitlayout-cli](https://github.com/FitLayout/docker-images/tree/main/fitlayout-cli) the Command-line interface for invoking FitLayout.
- [fitlayout-server](https://github.com/FitLayout/docker-images/tree/main/fitlayout-server) the FitLayout server application with a REST API.
- [fitlayout-frontend](https://github.com/FitLayout/docker-images/tree/main/fitlayout-frontend) a JavaScript frontend providing a graphical user interface ([PageView](https://github.com/FitLayout/PageView)) to FitLayout in a web browser.

The lastest versions of the docker images are also available on [docker hub](https://hub.docker.com/u/fitlayout).

A complete **demo application** that includes the configured server and client components can be set up using the ready-to-use [docker-compose](https://github.com/FitLayout/docker-images/tree/main/docker-compose) infrastructure.
