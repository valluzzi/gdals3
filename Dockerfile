FROM ghcr.io/osgeo/gdal:ubuntu-small-latest

RUN apt-get update
RUN apt-get -y install python3-pip git tar
# RUN pip3 install numpy==1.24.4
# RUN pip3 install numba==0.57.1

RUN apt-get -y install fuse s3fs 

ENV AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
ENV AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
ENV AWS_BUCKET_NAME=${AWS_BUCKET_NAME}

COPY ./mount-s3.sh .
RUN chmod +x mount-s3.sh 
# Remember to run with --privileged !!!! 
# docker run --privileged  -it p1
ENTRYPOINT ["./mount-s3.sh"]
