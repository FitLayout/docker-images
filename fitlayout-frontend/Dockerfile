FROM node:lts-alpine AS build-stage
WORKDIR /app
COPY app/package*.json ./
RUN npm install
COPY app/ .
RUN npm run build

FROM nginx:stable-alpine AS production-stage
# The following variables may be redefined using docker run
# when the proxy to a fitlayou server should be set up.
# API_PATH should be set to "/api/"
# SERVER_PROXY shouldbe set to something like "http://demoserver:8400/api/"
ENV API_PATH="/noneXnone/"
ENV SERVER_PROXY="http://127.0.0.1:8400/api/"
COPY nginx.conf /etc/nginx/nginx.conf
COPY http.conf.template /etc/nginx/templates/http.conf.template
COPY --from=build-stage /app/dist /usr/share/nginx/html/browser
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
