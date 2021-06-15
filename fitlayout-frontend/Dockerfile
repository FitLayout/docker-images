FROM node:lts-alpine as build-stage
WORKDIR /app
COPY app/package*.json ./
RUN npm install
COPY app/ .
RUN npm run build

FROM nginx:stable-alpine as production-stage
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build-stage /app/dist /usr/share/nginx/html/browser
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
