#!/bin/bash

mkdir local
rm -rf ./local/*

# Copy the docker compose to
# build (without any volume)
cp ./build/docker-compose-build.yml docker-compose.yml

# Run docker compose build
docker compose down
docker compose up -d --build
docker cp magento:/var/www/html/. ./local/

# Copy and run the docker compose to run
# after build (now, with the volume already set)
rm docker-compose.yml && cp ./build/docker-compose-after-install.yml docker-compose.yml
docker compose up -d
