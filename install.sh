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
    '\e[90m'       # Grey		| Credits
    '\e[91m'       # Red		| Update notifications Alert
    '\e[33m'       # Yellow		| Emphasis
)


readonly GREEN_LINE=" ${aCOLOUR[0]}─────────────────────────────────────────────────────$COLOUR_RESET"
readonly GREEN_BULLET=" ${aCOLOUR[0]}-$COLOUR_RESET"
readonly GREEN_SEPARATOR="${aCOLOUR[0]}:$COLOUR_RESET"

echo -e "${GREEN_LINE}${aCOLOUR[1]}"
echo -e "            ---------- Updating system ----------------"
echo -e "${GREEN_LINE}${aCOLOUR[1]}"

apt-get -y update < "/dev/null"

echo -e "${GREEN_LINE}${aCOLOUR[1]}"
echo "       -------------- System successfully updated! ---------------"
echo -e "${GREEN_LINE}${aCOLOUR[1]}"
echo "        ------------- Installing Java --------------"
echo -e "${GREEN_LINE}${aCOLOUR[1]}"

apt-get -y install default-jre < "/dev/null"

echo -e "${GREEN_LINE}${aCOLOUR[1]}"
echo "         ----------- Java Successfully Installed! ----------------"
echo -e "${GREEN_LINE}${aCOLOUR[1]}"
echo "         ------------ Cloning Blue0x Repository ------------"
echo -e "${GREEN_LINE}${aCOLOUR[1]}"

git clone https://github.com/theBlue0x/node.git

echo -e "${GREEN_LINE}${aCOLOUR[1]}"
echo "          ---------Successfully Cloned Blue0x Repo! ------------"
echo -e "${GREEN_LINE}${aCOLOUR[1]}"

cd node

echo -e "${GREEN_LINE}${aCOLOUR[1]}"
echo "             --------- Compiling Blue0x ---------"
echo -e "${GREEN_LINE}${aCOLOUR[1]}"

./compile.sh

echo -e "${GREEN_LINE}${aCOLOUR[1]}"
echo "        --------- Successfully Compiled Blue0x! ------------"
echo -e "${GREEN_LINE}${aCOLOUR[1]}"
echo "      --------- Running Blue0x and Syncing Chain ------------"
echo -e "${GREEN_LINE}${aCOLOUR[1]}"

./run.sh --daemon
