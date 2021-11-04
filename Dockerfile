FROM ubuntu:22.04
MAINTAINER lmilius12@gmail.com

RUN apt-get update && \
    DEBIAN_FRONTEND=nointeractive apt-get install -q -y --no-install-recommends \
    apt-utils \
    ca-certificates \
    lib32gcc1 \
    net-tools \
    lib32stdc++6 \
    lib32z1 \
    lib32z1-dev \
    curl

ENV HOME="/home/steam" \
    PATH="$PATH:/home/steam/Steam"

RUN useradd steam && \
    mkdir -p $HOME/Steam && \
    chown -R steam:steam $HOME

USER steam

ENV STEAMCMD_URL="http://media.steampowered.com/installer/steamcmd_linux.tar.gz" \
    STEAMCMD_DIR="$HOME/Steam"

WORKDIR $HOME

RUN curl -s "$STEAMCMD_URL" | tar -v -C "$STEAMCMD_DIR" -zx

