FROM ubuntu:22.04

LABEL maintainer="Anton Kiselev"

ENV TS_VERSION=MatriX.100
ENV DEBIAN_FRONTEND=noninteractive

EXPOSE 8090

RUN apt-get update && \
    apt-get install -y wget ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -r -u 1000 -g users -s /bin/bash torrserver && \
    mkdir -p /torrserver/db && \
    cd /torrserver && \
    wget -O TorrServer "https://github.com/YouROK/TorrServer/releases/download/$TS_VERSION/TorrServer-linux-amd64" && \
    chmod +x /torrserver/TorrServer && \
    chown -R torrserver:users /torrserver

USER torrserver
WORKDIR /torrserver

ENTRYPOINT ["/torrserver/TorrServer"]
CMD ["--path", "/torrserver/db"]
