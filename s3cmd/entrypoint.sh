#!/bin/sh

touch /root/.s3cfg
echo "access_key = ${S3CMD_ACCESS_KEY}" >> /root/.s3cfg
echo "secret_key = ${S3CMD_SECRET_KEY}" >> /root/.s3cfg
crond -f -l 8 -d 8 -L /dev/stdout
