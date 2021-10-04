FROM node:14.16.1-alpine3.11

RUN apk add --no-cache git

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn --ignore-scripts

COPY . .
RUN yarn && \ 
  yarn build && \
  apk del git

ENTRYPOINT ["yarn", "start"]
