#!/usr/bin/env bash

BLUE='\033[1;34m'
NC='\033[0m'

echo ""
echo -e "${BLUE}Updating system packages....${NC}"
echo ""

sudo apt update

echo ""
echo -e "${BLUE}Installing Docker....${NC}"
echo ""

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh 1> /dev/null

echo ""
echo -e "${BLUE}Cloning the Blue0x repo....${NC}"
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

sudo docker run -d --restart=unless-stopped -p 2020:2020 -p 6876:6876 --name blue0x_container blue0x

echo ""
echo -e "${BLUE}All done!${NC}"
echo ""


echo ""
echo -e "${BLUE}All done! You may exit the terminal.${NC}"
echo ""
