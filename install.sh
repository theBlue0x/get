#!/usr/bin/env bash

BLUE='\033[1;34m'
NC='\033[0m'

source ./docker.sh
source ./not_docker.sh

while true; do
    ${BLUE}read -p "Would you like to install Blue0x with Docker?" yn
    case $yn in
        [Yy]* ) ./docker.sh;;
        [Nn]* ) ./not_docker.sh;;
        * ) echo "Please answer yes or no.";;
    esac
done

