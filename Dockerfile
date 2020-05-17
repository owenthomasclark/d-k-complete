FROM node:alpine AS builder

WORKDIR '/app'

COPY package.json ./
RUN yarn install
COPY . .

RUN yarn start

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
