#!/usr/bin/env bash

BLUE='\033[1;34m'
NC='\033[0m'

read -p "Would you like to install Blue0x with Docker? (y/n) " answer

if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    ./docker.sh
else
    ./not_docker.sh
fi

