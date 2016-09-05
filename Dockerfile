FROM alpine:latest

ENV DEBIAN_FRONTEND noninteractive

## update/upgrade
RUN apk update && apk upgrade && \
## installation
apk add python py-pip && \
## additional pip installation of radicale
pip install radicale && \
## cleanup
rm -rf /tmp/* && \
## Adds a custom non root user with home directory
adduser -h /home/radicale -G radicale && \
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