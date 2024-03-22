FROM alpine:latest

RUN apk add --no-cache docker-compose nginx \
    && sudo adduser --sytem --shell /bin/bash --gecos 'Git Version Control' --group --disabled-password --home /home/git git \
    && sudo usermod -aG docker git \
    && mkdir ~/forgejo