ARG ALPINE_VERSION=3.17

FROM alpine:${ALPINE_VERSION}

MAINTAINER Anirudh Ramesh

ARG TZ=Asia/Kolkata

ENV PYTHONUNBUFFERED=1
ENV S3CMD_BUCKET_NAME=
ENV S3CMD_ACCESS_KEY=
ENV S3CMD_SECRET_KEY=

RUN mkdir -p /goodenough

RUN set -ex
RUN apk update
RUN apk add --no-cache --no-progress python3 git ca-certificates tzdata

RUN cp /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

RUN ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools python-dateutil python-magic

RUN git clone --depth=1 https://github.com/s3tools/s3cmd.git /opt/s3cmd
RUN rm -rf /opt/s3cmd/.git
RUN ln -s /opt/s3cmd/s3cmd /usr/bin/s3cmd

RUN apk del py-pip py-setuptools git

COPY crontab /etc/crontabs/root
COPY entrypoint.sh /entrypoint.sh
COPY main.sh /main.sh

RUN chmod 755 /entrypoint.sh

ENTRYPOINT /entrypoint.sh
