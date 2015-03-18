## galileo-builder-1.0.4
This repository contains **Dockerfile** of Galileo Builder 1.0.4 for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/calvinpark/galileo-builder-1.0.4/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).

### Base Docker Image
* [ubuntu:14.04](https://registry.hub.docker.com/u/library/ubuntu/)

### Installation
1. Install [Docker](https://www.docker.com/).
2. Download [automated build](https://registry.hub.docker.com/u/calvinpark/galileo-builder-1.0.4/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull calvinpark/galileo-builder-1.0.4`
(alternatively, you can build an image from Dockerfile: `docker build -t="calvinpark/galileo-builder-1.0.4" github.com/calvinpark/galileo-builder-1.0.4`)

### Usage
    docker run -it --rm calvinpark/galileo-builder-1.0.4
Follow the on-screen instructions.