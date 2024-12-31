#!/usr/bin/env bash

BLUE='\033[1;34m'
NC='\033[0m'

while true; do

echo -e "${BLUE}"

read -p "Do you want to use Docker to install Blue0x? (y/n) " yn

case $yn in 
	[yY] ) echo ok, we will proceed;
		break;;
	[nN] ) echo exiting...;
		exit;;
	* ) echo invalid response;;
esac

done

echo -e "${NC}"
echo doing stuff...
