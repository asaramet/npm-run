#Create an Ubuntu based image from the official node image on Debian
FROM node:19.6.0-buster-slim as node 
FROM ubuntu:jammy-20230126 as base
COPY --from=node /usr/local /usr/local/

# fix simlinks for npx, Yarn and PnPm
RUN corepack disable && corepack enable 

# replace npm in CMD with tini for better kernel signal handling 
RUN apt-get update \
        && apt-get -qq install -y --no-install-recommends tini \
        && rm -rf /var/lib/aps/lists

# set entrypoint to always run (CMD) commands with tini
ENTRYPOINT ["/usr/bin/tini", "--"]

# Exposed Ports
EXPOSE 3000 4200 80 443

# check every 30 s to ensure this service returns HTTP 200
HEALTHCHECK CMD curl -fs http://localhost: || exit 1

WORKDIR /app

# Run npm install and npm start
CMD npm install && npm cache clean --force && npm start