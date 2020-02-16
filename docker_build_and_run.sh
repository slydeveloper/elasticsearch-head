#!/bin/bash

source ./docker_build.sh
docker run --rm -p 9100:9100 $DOCKER_IMAGE_NAME