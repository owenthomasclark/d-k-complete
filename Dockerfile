FROM node:alpine AS builder

WORKDIR '/app'

COPY package.json .
RUN yarn install
COPY . .

RUN yarn start

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
