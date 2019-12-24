#/bin/bash

PORT=8888
VOLUME=?
while getopts p:v: OPT; do
    case ${OPT} in
        p) PORT=${OPTARG}   ;;
        v) VOLUME=${OPTARG} ;;
        *) exit 1           ;;
    esac
done

if ! [ -d ${VOLUME} ]; then
    VOLUME=/tmp/1
fi


DOCKER=/usr/local/bin/docker
${DOCKER} run --rm -it            \
          -p ${PORT}:8888         \
          -v ${VOLUME}:/root/work \
          --name plist-jupyter    \
          hotoku/python bash -lc /usr/local/bin/run-lab
