#!/bin/sh

CV_DIR_HOST="$(git rev-parse --show-toplevel)"
CV_DIR_GUEST="/home/cv"
TEX=$1

docker run -di --rm -v "${CV_DIR_HOST}:${CV_DIR_GUEST}" --entrypoint "docker/entrypoint.sh" --env TEXFILE=${TEX} sixc/cvmaker
