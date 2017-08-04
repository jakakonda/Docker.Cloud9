FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
  git \
  wget \
  build-essential \
  python \
  nodejs

ENV USERNAME=''
ENV PASSWORD=''

RUN git clone https://github.com/c9/core.git cloud9
RUN cloud9/scripts/install-sdk.sh
RUN mkdir data

EXPOSE 8080

VOLUME ['/cloud9', '/data']

ENTRYPOINT exec nodejs /cloud9/server.js -p 8080 -l 0.0.0.0 -a ${USERNAME}:${PASSWORD} -w /data
