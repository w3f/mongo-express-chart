FROM node:12.16.1-alpine3.11

WORKDIR /app

COPY . .

RUN apk add --no-cache git && \
  yarn

ENTRYPOINT ["yarn", "start"]
