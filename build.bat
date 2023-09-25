@echo off
set PAT="your github token"
set name=gdals3
docker build -t %name% .
echo %PAT% | docker login ghcr.io --username valluzzi --password-stdin
docker tag %name% ghcr.io/valluzzi/%name%:latest
docker push ghcr.io/valluzzi/%name%:latest
