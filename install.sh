#!/usr/bin/bash
clear
echo -e "\e[0m\c"
echo '
__________.__                _______          
\______   \  |  __ __   ____ \   _  \ ___  ___
 |    |  _/  | |  |  \_/ __ \/  /_\  \\  \/  /
 |    |   \  |_|  |  /\  ___/\  \_/   \>    < 
 |______  /____/____/  \___  >\_____  /__/\_ \
        \/                 \/       \/      \/
                                      
     --- Together. We Are the Bank. ---
'

set -e

# COLORS
readonly COLOUR_RESET='\e[0m'
readonly aCOLOUR=(
    '\e[38;5;154m' # green  	| Lines, bullets and separators
    '\e[1m'        # Bold white	| Main descriptions
)

readonly GREEN_LINE=" ${aCOLOUR[0]}─────────────────────────────────────────────────────$COLOUR_RESET"
readonly GREEN_BULLET=" ${aCOLOUR[0]}-$COLOUR_RESET"
readonly GREEN_SEPARATOR="${aCOLOUR[0]}:$COLOUR_RESET"

HOST=$(curl https://ipinfo.io/ip 2>/dev/null)

echo -e "   Your IP address is $HOST"

echo -e "${GREEN_LINE}${aCOLOUR[1]}"
echo -e "   Updating system"
echo -e "${GREEN_LINE}${aCOLOUR[1]}"

apt-get -y update < "/dev/null"

echo -e "${GREEN_LINE}${aCOLOUR[1]}"
echo "   System successfully updated!"
echo -e "${GREEN_LINE}${aCOLOUR[1]}"
echo "   Installing Java"
echo -e "${GREEN_LINE}${aCOLOUR[1]}"

apt-get -y install default-jdk < "/dev/null"

echo -e "${GREEN_LINE}${aCOLOUR[1]}"
echo "   Java Successfully Installed!"
echo -e "${GREEN_LINE}${aCOLOUR[1]}"
echo "   Cloning Blue0x Repository"
echo -e "${GREEN_LINE}${aCOLOUR[1]}"

git clone https://github.com/theBlue0x/node.git

echo -e "${GREEN_LINE}${aCOLOUR[1]}"
echo "   Successfully Cloned Blue0x Repo!"

cd node

echo -e "${GREEN_LINE}${aCOLOUR[1]}"
echo "   Please create a new Blue0x account at"
echo "   https://api.blue0x.com"
echo "   Once you have created your new Blue0x account," 
echo "   please copy/paste your address below"
echo -e "${GREEN_LINE}${aCOLOUR[1]}"
echo "Your Blue0x account address: " > /dev/tty
read add < /dev/tty
echo -e "nxt.myPlatform=$add" >> conf/nxt.properties
echo -e "${GREEN_LINE}${aCOLOUR[1]}"
echo "   Writing address to configuration file!"
echo -e "   Node Rewards will be sent to $add !"

echo -e "${GREEN_LINE}${aCOLOUR[1]}"
echo "   Compiling Blue0x"
echo -e "${GREEN_LINE}${aCOLOUR[1]}"

./compile.sh

echo -e "${GREEN_LINE}${aCOLOUR[1]}"
echo "   Successfully Compiled Blue0x!"
echo -e "${GREEN_LINE}${aCOLOUR[1]}"
echo "   Running Blue0x and Syncing Chain"
echo -e "${GREEN_LINE}${aCOLOUR[1]}"

./run.sh --daemon

echo -e "   Your node is now running!"
echo -e "   It will take a few minutes to fully sync."
echo -e "   Once it has completed, it will be available at $HOST:2022"
echo -e "${GREEN_LINE}${aCOLOUR[1]}"
echo -e "   You can verify that your node is properly"
echo -e "   configured by visiting"
echo -e "   https://blue0x.com/node.html"
echo -e "   Your Node IP: $HOST"
