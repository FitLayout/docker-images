FROM node:lts-alpine as build-stage
WORKDIR /app
COPY app/package*.json ./
RUN npm install
COPY app/ .
RUN npm run build

FROM fitlayout/fitlayout-core
LABEL maintainer="Radek Burget, burgetr@fit.vutbr.cz" description="FitLayout local server image."

ENV PORT 8401

# Install nginx
RUN apt-get update \
&& DEBIAN_FRONTEND=noninteractive apt-get -y install nginx

COPY ./nginx.conf /etc/nginx/sites-available/default

# Copy the browser app
COPY --from=build-stage /app/dist /var/www/html/browser

# FitLayout config used for CLI
COPY ./config-local.properties ${DEPLOYMENT_DIR}

# Entry point
COPY ./local-entrypoint.sh /
ENTRYPOINT ["/local-entrypoint.sh"]
WORKDIR ${DEPLOYMENT_DIR}
EXPOSE 80
