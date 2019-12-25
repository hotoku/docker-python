#!/bin/bash


cat /tmp/jupyterlab.err                          |\
    grep http://127                              |\
    tail -n1                                     |\
    awk '{print $2}'                             |\
    sed -E -e "s|127.0.0.1:8888|127.0.0.1:9002|" |\
    xargs open
