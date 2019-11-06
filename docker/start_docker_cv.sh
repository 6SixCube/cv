#!/bin/bash

SMC_DIR="/home/pierre/PERSO/CV"
FWKV3_HOSTNAME=cvmaker
DOCKER_IMAGE_NAME=sixc/cvmaker
PROGRAM_DIR=$(realpath $(dirname "$0"))
DOCKER_CMD=$(which docker)
CONTAINER_NAME=sixc/cvmaker
SMC_DIR_IN_DOCKER="/home/cv"

launch () {
	echo ''
	echo ''
	echo "Running container ${CONTAINER_NAME}..."
	echo '======================================'
	echo ''

	xauth add fwkv3-docker/unix:0 . $KEY
	${DOCKER_CMD} run -it \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		--name "${CONTAINER_NAME}" \
		-v $HOME/.Xauthority:/tmp/.Xauthority \
		-v /dev/snd:/dev/snd \
		-e DISPLAY=unix$DISPLAY \
		-e XAUTHORITY=/tmp/.Xauthority \
		-e SSH_AUTH_SOCK="${SSH_AUTH_SOCK}" \
		-e PYTHONPATH="${ROBOTFRAMEWORK_DIR_IN_DOCKER}/lib" \
		-e LOCAL_USER_ID="$(id -u ${USER})" \
		-e LOCAL_USER_SHELL="${SHELL}" \
		-h "${FWKV3_HOSTNAME}" \
		--network host \
		-v "${SMC_DIR}:${SMC_DIR_IN_DOCKER}" \
		-v $(dirname "${SSH_AUTH_SOCK}"):$(dirname "${SSH_AUTH_SOCK}") \
		-v /tmp:/tmp \
		$CONTAINER_NAME
}

verify_before_launch () {
	verify_docker
	verify_docker_image
	verify_running_container
}


verify_docker () {
	if [ -z "${DOCKER_CMD}" ]
		then
		echo -e "" >&2
		echo -e "" >&2
		echo -e "Docker tool is missing" >&2
		echo -e "" >&2
		echo -e "ERROR: You need to install Docker" >&2
		echo -e "=================================" >&2
		echo -e "" >&2
		exit 1
	fi
}

verify_docker_image () {
	local docker_image=
	docker_images="$(docker images -q ${DOCKER_IMAGE_NAME} | wc -l)"
	if [ "$docker_images" -ne 1 ]
	then
		echo -e "" >&2
		echo -e "" >&2
		echo -e "Docker image have not been build" >&2
		echo -e "" >&2
		echo -e "ERROR: You need to run ${PROGRAM_DIR}/build_docker_cvmaker.sh" >&2
		echo -e "==============================================================================" >&2
		echo -e "" >&2
		exit 1
	fi
}
verify_running_container () {
	if [ "$(docker ps -a | grep ${CONTAINER_NAME} | wc -l)" -eq "1" ]
		then
		echo ""
		echo ""
		echo "${CONTAINER_NAME} image found..."
		echo ""
		echo "Deleting old ${CONTAINER_NAME} container"
		echo ""
		${DOCKER_CMD} stop "${CONTAINER_NAME}" &> /dev/null
		${DOCKER_CMD} rm "${CONTAINER_NAME}"
	fi
}

verify_before_launch
launch
