
FROM ubuntu:16.04
MAINTAINER Ryan Desfosses <ryan@desfo.org>

COPY . /app

ENV node nodejs

WORKDIR /app

RUN apt-get update \
    && apt-get install -y \
         libtiff5-dev \
         libjpeg8-dev \
         zlib1g-dev \
         libfreetype6-dev \
         liblcms2-dev \
         libwebp-dev \
         tcl8.6-dev \
         tk8.6-dev \
         python-tk \
         libxslt-dev \
         libxml2-dev \
         virtualenv \
         nodejs \
         npm \
         --no-install-recommends \ 
    && rm -rf /var/lib/apt/lists/* \
    && ln -s $(which nodejs) /usr/bin/node \
    && npm install \
    && make install
