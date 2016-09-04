FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

## Base packages
RUN apt-get update -qq && apt-get upgrade -y -qq
RUN apt-get install -y python3 python-pip
######

## Radicale installation
RUN pip install radicale
######

# Adds a custom non root user with home directory
RUN useradd -d /home/radicale -m radicale

# Create some folder
RUN mkdir -p /data/radicale
RUN mkdir -p /home/radicale/.config
RUN ln -s /data/radicale /home/radicale/.config/radicale

RUN chown -R radicale:radicale /data/radicale/
RUN chown -R radicale:radicale /home/radicale/.config
######

EXPOSE 5232
VOLUME ["/data/radicale"]

# Fix empty $HOME
ENV HOME /home/radicale
USER radicale
WORKDIR /home/radicale
CMD ["radicale"]