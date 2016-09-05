FROM alpine:latest

ENV DEBIAN_FRONTEND noninteractive

## update/upgrade
RUN apt-get update -qq && apt-get upgrade -y -qq && \
## installation
apt-get install -y python3 python-pip && \
## cleanup
rm -rf /var/lib/apt/lists/* && \
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