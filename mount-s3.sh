#!/bin/bash

if [ -n "$AWS_ACCESS_KEY_ID" ] && [ -n "$AWS_SECRET_ACCESS_KEY" ] && [ -n "$AWS_BUCKET_NAME" ] 
then
    echo "Mounting S3 bucket:s3://$AWS_BUCKET_NAME into /mnt/s3/$AWS_BUCKET_NAME ..."
    echo "$AWS_ACCESS_KEY_ID:$AWS_SECRET_ACCESS_KEY" > /etc/passwd-s3fs
    chmod 600 /etc/passwd-s3fs
    mkdir -p /mnt/s3/$AWS_BUCKET_NAME
    s3fs $AWS_BUCKET_NAME /mnt/s3/$AWS_BUCKET_NAME -o passwd_file=/etc/passwd-s3fs -o use_path_request_style
    rm -rf /etc/passwd-s3fs
    cd /mnt/s3/$AWS_BUCKET_NAME
    echo "done!"
else
    echo "Please set ACCESS_KEY, AWS_SECRET_ACCESS_KEY and AWS_BUCKET_NAME environment variables to mount s3 drive."
fi

exec "bash"
