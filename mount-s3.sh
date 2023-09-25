#!/bin/bash

if [ -n "$ACCESS_KEY" ] && [ -n "$SECRET_KEY" ] && [ -n "$BUCKET_NAME" ] 
then
    echo "Mounting S3 bucket:s3://$BUCKET_NAME into /mnt/s3/$BUCKET_NAME ..."
    echo "$ACCESS_KEY:$SECRET_KEY" > /etc/passwd-s3fs
    chmod 600 /etc/passwd-s3fs
    mkdir -p /mnt/s3/$BUCKET_NAME
    s3fs $BUCKET_NAME /mnt/s3/$BUCKET_NAME -o passwd_file=/etc/passwd-s3fs -o use_path_request_style
    rm -rf /etc/passwd-s3fs
    cd /mnt/s3/$BUCKET_NAME
    echo "done!"
else
    echo "Please set ACCESS_KEY, SECRET_KEY and BUCKET_NAME environment variables to mount s3 drive."
fi

exec "bash"
