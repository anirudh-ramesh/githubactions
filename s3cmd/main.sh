#!/bin/sh

for file in /goodenough/*; do
	s3cmd put "$file" s3://${S3CMD_BUCKET_NAME}
done
