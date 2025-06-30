#!/usr/bin/env bash

BLUE='\033[1;34m'
NC='\033[0m'
lanIp="$(hostname  -I | cut -f1 -d' ')";
wanIp="$(curl https://ipinfo.io/ip 2>/dev/null)";

echo ""
echo -e "${BLUE}Updating system packages... ${NC}"
echo ""

sudo apt update && sudo apt upgrade -y

echo ""
echo -e "${BLUE}Checking if Docker is installed... ${NC}"
echo ""

if command -v docker &> /dev/null; then
echo -e "${BLUE}Docker is already installed. ${NC}"

else
echo -e "${BLUE}Docker not installed. Installing now... ${NC}"
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh 1> /dev/null
echo ""
fi

echo ""
echo -e "${BLUE}Cloning the Blue0x repo... ${NC}"
echo ""

git clone https://github.com/theBlue0x/node_new.git

cd node_new

echo ""
echo -e "${BLUE}Building the Blue0x Docker container....${NC}"
echo ""

sudo docker build -t blue0x .

echo ""
echo -e "${BLUE}Starting Blue0x....${NC}"
echo ""

sudo docker run -d --restart=unless-stopped --network=host --name blue0x blue0x

echo ""
/*echo -e "${BLUE}Blue0x is now running!"
echo ""
echo -e "Please allow a few minutes for the wallet to start..."
echo ""
echo -e "You can view your wallet here -> ${NC}http://${wanIp}:6876"
echo ""
echo -e ${BLUE}"If you are on a local network, you can view your" 
echo -e "wallet here -> ${NC}http://${lanIp}:6876"
echo ""
echo -e "${BLUE}To stop Blue0x, run ${NC}'sudo docker stop blue0x'"
echo ""
echo -e "${BLUE}You are all done. You may close this window.${NC}"
echo ""*/
