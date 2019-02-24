#!/bin/bash

function deploy {
    echo "ok $1"
}

if [ -z $1 ]; then
    cat README.md
elif [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    cat README.md
else
    deploy $1
fi