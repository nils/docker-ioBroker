FROM node:8-alpine

# inspired by https://github.com/iobroker/docker-iobroker
MAINTAINER Vegetto <git@angelnu.com>

# Install required dependencies for the adapters
# git: needed to download beta adapters
# avahi-dev: needed by mdns (iobroker.chromecast)
# make gcc g++ python linux-headers udev: needed by serialport (iobroker.discovery) - https://www.npmjs.com/package/serialport#platform-support
RUN apk add --no-cache \
      bash python build-base \
      git \
      avahi-dev \
      make gcc g++ python linux-headers udev

# Install base iobroker
RUN mkdir -p /opt/iobroker/
WORKDIR /opt/iobroker/
RUN npm install iobroker --unsafe-perm

#Install adapters listed by adapters2install.json and add admin
ADD adapters2install.json package.json
RUN npm install --production --save --prefix /opt/iobroker && \
    iobroker add admin

ADD scripts/run.sh run.sh

VOLUME /opt/iobroker
#The iobroker_data has to be preserved across updates
VOLUME /opt/iobroker/iobroker_data

EXPOSE 8081 8082 8083 8084
ENTRYPOINT ["run.sh"]
