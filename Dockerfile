FROM ubuntu:latest
MAINTAINER Anton Kiselev

ENV TS_VERSION=1.1.70

EXPOSE 8090:8090

RUN apt-get update && apt-get install -y wget && \
    mkdir /db/ && \
    wget -O TorrServer "https://github.com/YouROK/TorrServer/releases/download/$TS_VERSION/TorrServer-linux-amd64" && \
    chmod +x TorrServer

ENTRYPOINT ["TorrServer"]
CMD ["--path", "/db/"]
