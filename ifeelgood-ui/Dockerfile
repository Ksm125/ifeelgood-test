FROM node:20.11.1-alpine AS packages

RUN apk update && apk upgrade && apk add --no-cache git python3 make gcc g++

COPY package.json package.json
COPY package-lock.json package-lock.json

# Dev step
FROM packages AS npm-dev

WORKDIR /app

RUN npm install
COPY . .
EXPOSE 8080
CMD ["npm", "run", "dev"]
