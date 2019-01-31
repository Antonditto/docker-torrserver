FROM ubuntu:latest
MAINTAINER Anton Kiselev

ENV TS_VERSION=1.1.70

EXPOSE 8090:8090

RUN apt-get update && apt-get install -y wget && \
    mkdir -p /torrserver/bd && \
    wget -O TorrServer -P /torrserver/ "https://github.com/YouROK/TorrServer/releases/download/$TS_VERSION/TorrServer-linux-amd64" && \
    chmod +x /torrserver/TorrServer
    

CMD ["/torrserver/TorrServer","-d /torrserver/bd/"]
