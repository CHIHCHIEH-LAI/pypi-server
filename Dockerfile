FROM python:3.9-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    s3fs \
    fuse \
    && rm -rf /var/lib/apt/lists/*

# Define the working directory
WORKDIR /app

# Install pypiserver
RUN pip install pypiserver

# Expose the port for pypiserver
EXPOSE 8082

# Define environment variables
ENV S3_BUCKET="package"
ENV S3_REGION="ap-northeast-1"
ENV MOUNT_POINT="/app/mnt/pypi"

# Copy the password file
COPY .passwd-s3fs /app/.passwd-s3fs
RUN chmod 600 /app/.passwd-s3fs

# Create a directory for the packages
RUN mkdir -p $MOUNT_POINT

# Copy the entrypoint script
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Set the entrypoint script
ENTRYPOINT ["./entrypoint.sh"]