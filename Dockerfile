FROM node:12.16.1-alpine3.11

WORKDIR /app

ADD . /app

RUN yarn

ENTRYPOINT ["yarn", "start"]
