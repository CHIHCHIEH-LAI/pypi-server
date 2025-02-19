#!/bin/sh
exec docker run --privileged -p 6666:6666 \
    -e S3_BUCKET="radisen-package" \
    -e S3_REGION="ap-northeast-1" \
    pypiserver:0.1.0