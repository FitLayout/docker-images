FROM maven:3.9.9-eclipse-temurin-17-alpine AS build

WORKDIR /FitLayout
COPY files/FitLayout/ .
RUN mvn clean install -P assembly -DskipTests -Dmaven.javadoc.skip=true

WORKDIR /FitLayoutWeb
COPY files/FitLayoutWeb/ .
WORKDIR FitLayoutWebService
RUN mvn clean package && mvn payara-micro:bundle

FROM ubuntu:22.04 AS production
LABEL maintainer="Radek Burget, burgetr@fit.vut.cz" description="Base image with FitLayout packages, puppeteer-based rendering backend and the required Java and node.js runtimes"
# Image setup: java, nodejs
RUN apt-get update \
&& DEBIAN_FRONTEND=noninteractive apt-get -y install openjdk-17-jdk locales curl apt-transport-https \
&& DEBIAN_FRONTEND=noninteractive apt-get -y install libgbm1 gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates gnupg fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget xvfb \
&& mkdir -p /etc/apt/keyrings \
&& curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
&& echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list \
&& apt-get update \
&& DEBIAN_FRONTEND=noninteractive apt-get -y install nodejs \
&& rm -rf /var/lib/apt/lists/* \
&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8
ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-amd64

ENV CLI_DIR /opt/cli
ENV DEPLOYMENT_DIR /opt/server

# FitLayout CLI
ENV CLI FitLayout.jar
RUN mkdir -p ${CLI_DIR}
COPY --from=build /FitLayout/fitlayout-tools/target/${CLI} ${CLI_DIR}

# FitLayout server
ENV BUNDLE fitlayout-web-microbundle.jar
RUN mkdir -p ${DEPLOYMENT_DIR}
COPY --from=build /FitLayoutWeb/FitLayoutWebService/target/${BUNDLE} ${DEPLOYMENT_DIR}

# Puppeteer backend
ENV BACKEND_DIR /opt/fitlayout-puppeteer
RUN mkdir ${BACKEND_DIR}
RUN mkdir ${BACKEND_DIR}/extensions # an empty directory where browser extensions can be added
COPY ./files/index.js ${BACKEND_DIR}
COPY ./files/package*.json ${BACKEND_DIR}/
RUN cd ${BACKEND_DIR} && npm install
