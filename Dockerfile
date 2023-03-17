FROM node:16.13.0-alpine3.11

RUN apk add --no-cache git

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn --ignore-scripts

COPY . .
RUN yarn && \ 
  apk del git

ENTRYPOINT ["yarn", "start"]
