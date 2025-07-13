# Docker container for TorrServer

A Docker container for running TorrServer - a torrent streaming server that allows you to stream torrents directly without downloading them first.

## Features

- Based on Ubuntu 22.04 LTS
- Runs as non-root user for security
- Automatic database persistence
- Exposes port 8090 for web interface

## Building

```bash
docker build -t torrserver .
```

## Running

```bash
docker run -d -p 8090:8090 -v $(pwd)/db:/torrserver/db --name torrserver torrserver
```

## Access

Open your browser and navigate to `http://localhost:8090` to access the TorrServer web interface.

## Version

Current version: MatriX.100

## Data Persistence

The container uses `/torrserver/db` for database storage. Mount this directory to preserve your settings and torrent data between container restarts.
