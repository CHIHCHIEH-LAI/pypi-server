#!/bin/sh
# Mount the S3 bucket
s3fs $S3_BUCKET $MOUNT_POINT -o endpoint=$S3_REGION -o passwd_file=.passwd-s3fs

# Run pypiserver
exec pypi-server run -p 6666 --overwrite $MOUNT_POINT -i 0.0.0.0 -a . -P.