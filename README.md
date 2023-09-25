# gdals3
Docker with gdal and s3 mount

Please specify 
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- AWS_BUCKET_NAME

Es: Run docker
docker run --privileged -it -e AWS_ACCESS_KEY_ID=XXXXXXX -e AWS_SECRET_ACCESS_KEY=XXXXXXX -e AWS_BUCKET_NAME=bucketname gdals3
