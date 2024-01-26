# syntax=docker/dockerfile:1

# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/engine/reference/builder/

ARG NODE_VERSION=18.14.2

FROM node:${NODE_VERSION}-alpine
RUN adduser -DS wa-gateway
# Use production node environment by default.
ENV NODE_ENV production

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN npm install
# Expose the port that the application listens on.
EXPOSE 5001

RUN chown -Rv wa-gateway /usr/src/app
USER wa-gateway
# Run the application.
CMD npm run start
