#/bin/bash

PORT=8888
VOLUME=/Users/hotoku/samples/ipynotebook

while getopts p:v: OPT; do
    case ${OPT} in
        p) PORT=${OPTARG}   ;;
        v) VOLUME=${OPTARG} ;;
        *) exit 1           ;;
    esac
done


DOCKER=/usr/local/bin/docker
${DOCKER} run --rm -p ${PORT}:8888 -v ${VOLUME}:/root/work hotoku/python bash -lc /usr/local/bin/run-lab
