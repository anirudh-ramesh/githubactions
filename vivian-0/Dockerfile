ARG ALPINE_VERSION=3.17

FROM alpine:${ALPINE_VERSION}

MAINTAINER Anirudh Ramesh

ARG TZ=Asia/Kolkata

RUN mkdir -p /goodenough /etc/periodic/1min /source /destination

RUN set -ex
RUN apk update
RUN apk add --no-cache --no-progress tzdata

RUN cp /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

COPY crontab /etc/crontabs/root
COPY entrypoint.sh /entrypoint.sh
COPY read.sh /read.sh

RUN chmod 755 /entrypoint.sh

ENTRYPOINT /entrypoint.sh
