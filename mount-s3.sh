#!/bin/bash
echo "Mounting S3 bucket..."
chmod 600 /etc/passwd-s3fs
mkdir -p /mnt/s3/saferplaces.co
s3fs saferplaces.co /mnt/s3/saferplaces.co -o passwd_file=/etc/.passwd-s3fs -o use_path_request_style 
cd /mnt/s3/saferplaces.co
# Start your application (replace with your actual command)
echo "done!"
exec "bash"
