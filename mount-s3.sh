#!/bin/bash
echo "Mounting S3 bucket..."
echo "$ACCESS_KEY:$SECRET_KEY" > /etc/passwd-s3fs
chmod 600 /etc/passwd-s3fs
mkdir -p /mnt/s3/$BUCKET_NAME
s3fs $BUCKET_NAME /mnt/s3/$BUCKET_NAME -o passwd_file=/etc/passwd-s3fs -o use_path_request_style
rm -rf /etc/passwd-s3fs
cd /mnt/s3/$BUCKET_NAME
# Start your application (replace with your actual command)
echo "done!"
exec "bash"
