#!/bin/bash




PORT=8888
VOLUME=?
INTERACTIVE=?
while getopts p:v:i OPT; do
    case ${OPT} in
        p) PORT=${OPTARG}   ;;
        v) VOLUME=${OPTARG} ;;
        i) INTERACTIVE=true ;;
        *) exit 1           ;;
    esac
done

if [ -d ${VOLUME} ]; then
    VOLUME_OP="-v ${VOLUME}:/root/work"
fi

if [ ${INTERACTIVE} = "true" ]; then
    IT_OP="-it"
fi


DOCKER=/usr/local/bin/docker
${DOCKER} run --rm ${IT_OP}       \
          -p ${PORT}:8888         \
          ${VOLUME_OP}            \
          --name plist-jupyter    \
          hotoku/python bash -lc /usr/local/bin/run-lab
