#!/usr/bin/env bash

BLUE='\033[1;34m'
NC='\033[0m'
lanIp="$(hostname  -I | cut -f1 -d' ')";
wanIp="$(curl https://ipinfo.io/ip 2>/dev/null)";

echo ""
echo -e "${BLUE}Updating system packages....${NC}"
echo ""

sudo apt update

echo ""
echo -e "${BLUE}Installing Java....${NC}"
echo ""

# Install Azull JDK 11 amd64 TODO: add check and install or ARM

curl https://cdn.azul.com/zulu/bin/zulu11.76.21-ca-jdk11.0.25-linux_amd64.deb
sudo apt install zulu11.76.21-ca-jdk11.0.25-linux_amd64.deb

echo ""
echo -e "${BLUE}Cloning the Blue0x repo....${NC}"
echo ""

git clone https://github.com/theBlue0x/node_new.git

cd node_new

echo ""
echo -e "${BLUE}Compiling Blue0x....${NC}"
echo ""

sh compile.sh

echo ""
echo -e "${BLUE}Starting Blue0x....${NC}"
echo ""

sh run.sh --daemon

echo ""
echo -e "${BLUE}Blue0x is now running!"
echo ""
echo -e "Please allow a few minutes for the wallet to start..."
echo ""
echo -e "You can view your wallet here -> ${NC}http://${wanIp}:6876"
echo ""
echo -e ${BLUE}"If you are on a local network, you can view your" 
echo -e "wallet here -> ${NC}http://${lanIp}:6876"
echo ""
echo -e "${BLUE}To stop Blue0x, run ${NC}'sh stop.sh'"
echo ""
echo -e "${BLUE}You are all done. You may close this window.${NC}"
echo ""
