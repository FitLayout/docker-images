FROM node:lts-alpine AS build-stage
WORKDIR /app
COPY app/package*.json ./
RUN npm install
COPY app/ .
RUN npm run build

FROM nginx:stable-alpine AS production-stage
COPY default.conf /etc/nginx/conf.d/default.conf
COPY --from=build-stage /app/dist /usr/share/nginx/html/auth
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
