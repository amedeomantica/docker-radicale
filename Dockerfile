FROM alpine:latest

ENV DEBIAN_FRONTEND noninteractive

## update/upgrade
RUN apk update && apk upgrade && \
## installation
apk add python py-pip && \
## cleanup
apk cache clean && \
rm -rf /tmp/* && \
## additional pip installation of radicale
pip install radicale && \
## Adds a custom non root user with home directory
useradd -d /home/radicale -m radicale && \
## Create some folders and link the config
mkdir -p /data/radicale && \
mkdir -p /home/radicale/.config && \
ln -s /data/radicale /home/radicale/.config/radicale && \
## permission
chown -R radicale:radicale /data/radicale/ && \
chown -R radicale:radicale /home/radicale/.config

## ports
EXPOSE 5232
## volumes
VOLUME ["/data/radicale"]

## set home env
ENV HOME /home/radicale
## change to user radicale
USER radicale
## use directory
WORKDIR /home/radicale
## start radicale
CMD ["radicale"]