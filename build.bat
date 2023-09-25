@echo off
set name=gdals3
docker build -t %name% .
::docker build --build-arg ACCESS_KEY=your-access-key --build-arg SECRET_KEY=your-secret-key -t %name% .
echo %PAT% | docker login ghcr.io --username valluzzi --password-stdin
docker tag %name% ghcr.io/valluzzi/%name%:latest
docker push ghcr.io/valluzzi/%name%:latest
