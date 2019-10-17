FROM node:10.16.3-alpine as node

WORKDIR /opt/
COPY package.json .
RUN npm install
COPY . .
RUN ./node_modules/@angular/cli/bin/ng build

FROM nginx
RUN rm /usr/share/nginx/html/*
COPY --from=node /opt/dist/. /usr/share/nginx/html/
