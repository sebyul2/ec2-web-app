#!/bin/sh

DOCKER_APP_NAME=webapp
EXIST_BLUE=$(docker-compose -p ${DOCKER_APP_NAME}-blue -f docker-compose.blue.yml ps | grep Up)

git pull origin develop

if [ -z "$EXIST_BLUE" ]; then
    docker-compose -p ${DOCKER_APP_NAME}-blue -f docker-compose.blue.yml build
    docker-compose -p ${DOCKER_APP_NAME}-blue -f docker-compose.blue.yml up -d

    sleep 10

    docker-compose -p ${DOCKER_APP_NAME}-green -f docker-compose.green.yml down
else
    docker-compose -p ${DOCKER_APP_NAME}-green -f docker-compose.green.yml build
    docker-compose -p ${DOCKER_APP_NAME}-green -f docker-compose.green.yml up -d

    sleep 10

    docker-compose -p ${DOCKER_APP_NAME}-blue -f docker-compose.blue.yml down
fi