FROM node:20-alpine3.16 as builder 

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn --ignore-scripts

COPY . .
RUN yarn && \ 
  yarn build

FROM node:20-alpine3.16
WORKDIR /app
COPY --from=builder /app /app

ENTRYPOINT ["yarn", "start"]