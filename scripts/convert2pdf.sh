#!/bin/sh

CV_DIR_HOST="/home/pierre/PERSO/CV"
CV_DIR_GUEST="/home/cv"


docker rm cvmaker
docker run -it --rm -v "${CV_DIR_HOST}:${CV_DIR_GUEST}" --entrypoint "docker/entrypoint.sh" cvmaker 
