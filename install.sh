#!/bin/sh

DOCKER_APP_NAME=webapp

docker kill $(docker ps -f name=webapp -q)
docker rm -f $(docker ps -f name=webapp -a -q)
docker rmi -f $(docker images --filter=reference="webapp*:*")

git pull origin develop

docker-compose -p ${DOCKER_APP_NAME}-blue -f docker-compose.yml up -d
