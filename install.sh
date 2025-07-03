#!/bin/bash

BLUE='\033[1;34m'
NC='\033[0m'

while true; do
    read -p "${BLUE} Would you like to install Blue0x with Docker? ${NC} " yn </dev/tty
    case $yn in
        [Yy]* ) 
        source ./docker.sh
        break;;
        [Nn]* ) 
        source ./not_docker.sh
        break;;
        * )
        echo ""
        echo "Invalid response. Please answer y or n.";;
    esac
done
