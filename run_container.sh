#!/bin/sh
exec docker run --privileged -p 8082:8082 \
    -e S3_BUCKET="package" \
    -e S3_REGION="ap-northeast-1" \
    pypiserver:0.1.0