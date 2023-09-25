FROM ghcr.io/osgeo/gdal:ubuntu-small-latest

RUN apt-get update
RUN apt-get -y install python3-pip git tar
# RUN pip3 install numpy==1.24.4
# RUN pip3 install numba==0.57.1

RUN apt-get -y install fuse s3fs 

ARG ACCSESS_KEY
ARG SECRET_KEY
ENV ACCSESS_KEY=${ACCSESS_KEY}
ENV SECRET_KEY=${SECRET_KEY}
RUN echo "${ACCESS_KEY}:${SECRET_KEY}" > /etc/passwd-s3fs
ENV ACCSESS_KEY=""
ENV SECRET_KEY=""
# mount s3 bucket with s3fs
# COPY ./passwd-s3fs /etc/passwd-s3fs
# RUN chmod 600 /etc/passwd-s3fs

COPY ./mount-s3.sh .
RUN chmod +x mount-s3.sh

# Remember to run with --privileged !!!! 
# docker run --privileged  -it p1
ENTRYPOINT ["./mount-s3.sh"]
