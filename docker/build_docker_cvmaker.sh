#!/bin/bash

DOCKER_IMAGE_NAME=cvmaker
DOCKER_CMD="$(which docker)"
DOCKERFILEPATH="$(git rev-parse --show-toplevel)/docker/cvmaker.dockerfile"

if [ -z "${DOCKER_CMD}" ]
then
  echo "docker is missing" >&2
  echo "INFO: run apt install docker" >&2
  exit 1
fi


echo 'Installation de docker'
echo '======================'
echo

${DOCKER_CMD} build --rm  \
	-f "${DOCKERFILEPATH}" \
	-t ${DOCKER_IMAGE_NAME} \
	"."
