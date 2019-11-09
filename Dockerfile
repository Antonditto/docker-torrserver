FROM ubuntu:disco
MAINTAINER Anton Kiselev

ENV TS_VERSION=1.1.76

EXPOSE 8090:8090

RUN apt-get update && apt-get install -y wget && \
    mkdir /torrserver/ && cd /torrserver/ && mkdir /db && \
    wget -O TorrServer -P /torrserver/ "https://github.com/YouROK/TorrServer/releases/download/$TS_VERSION/TorrServer-linux-amd64" && \
    chmod +x /torrserver/TorrServer

ENTRYPOINT ["/torrserver/TorrServer"]
CMD ["--path", "/torrserver/db"]
