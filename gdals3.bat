@echo off
docker build --build-arg ACCESS_KEY=your-access-key --build-arg SECRET_KEY=your-secret-key -t gdals3 .
docker push gdals3