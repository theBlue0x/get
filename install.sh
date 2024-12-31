#!/usr/bin/env bash

BLUE='\033[1;34m'
NC='\033[0m'

echo ""
echo -e "${BLUE}Updating system packages....${NC}"
echo ""

sudo apt update

echo ""
echo -e "${BLUE}Installing Java....${NC}"
echo ""

sudo apt install -qq openjdk-11-jdk-headless -y

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
echo -e "${BLUE}All done! You may exit the terminal.${NC}"
echo ""
