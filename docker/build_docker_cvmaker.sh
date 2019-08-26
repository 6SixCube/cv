#!/bin/bash

DOCKER_IMAGE_NAME=cvmaker
DOCKER_CMD="$(which docker)"

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
	-f "cvmaker.dockerfile" \
	-t ${DOCKER_IMAGE_NAME} \
	"."
