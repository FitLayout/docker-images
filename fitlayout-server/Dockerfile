FROM ubuntu

# Image setup: java, nodejs
RUN apt-get update \
&& DEBIAN_FRONTEND=noninteractive apt-get -y install openjdk-11-jdk locales curl \
&& DEBIAN_FRONTEND=noninteractive apt-get -y install libgbm1 gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget \
&& curl -sL https://deb.nodesource.com/setup_14.x | bash - \
&& DEBIAN_FRONTEND=noninteractive apt-get -y install nodejs \
&& rm -rf /var/lib/apt/lists/* \
&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

# FitLayout server
ENV DEPLOYMENT_DIR /opt
ENV BUNDLE fitlayout-web-microbundle.jar
ENV PORT 8400
COPY ./files/${BUNDLE} ${DEPLOYMENT_DIR}
COPY ./config.properties ${DEPLOYMENT_DIR}

# Puppeteer backend
ENV BACKEND_DIR /opt/fitlayout-puppeteer
RUN mkdir ${BACKEND_DIR}
COPY ./files/index.js ${BACKEND_DIR}
COPY ./files/package*.json ${BACKEND_DIR}/
RUN cd ${BACKEND_DIR} && npm install

# Entry point
ENTRYPOINT java -jar ${BUNDLE} --port ${PORT} --systemproperties ${DEPLOYMENT_DIR}/config.properties
WORKDIR ${DEPLOYMENT_DIR}
EXPOSE ${PORT}
HEALTHCHECK --interval=1m CMD curl --fail http://localhost:8400/service/artifact/list || exit 1
