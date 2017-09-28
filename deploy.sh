#!/bin/sh

DOCKER_APP_NAME=webapp

EXIST_BLUE=$(docker-compose -p ${DOCKER_APP_NAME}-blue -f docker-compose.blue.yml ps | grep Up)

if [ -z "$EXIST_BLUE" ]; then
    docker-compose -p ${DOCKER_APP_NAME}-blue -f docker-compose.blue.yml pull
    docker-compose -p ${DOCKER_APP_NAME}-blue -f docker-compose.blue.yml up -d

    sleep 10

    docker-compose -p ${DOCKER_APP_NAME}-green -f docker-compose.green.yml down
else
    docker-compose -p ${DOCKER_APP_NAME}-green -f docker-compose.green.yml pull
    docker-compose -p ${DOCKER_APP_NAME}-green -f docker-compose.green.yml up -d

    sleep 10

    docker-compose -p ${DOCKER_APP_NAME}-blue -f docker-compose.blue.yml down
fi