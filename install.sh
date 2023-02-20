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
echo -e "---------- Updating system ----------------"
echo -e "${GREEN_LINE}${aCOLOUR[1]}"

apt-get -y update < "/dev/null"

echo ''
echo ''
echo '${GREEN}---------- System successfully updated! ------------'
echo '---------- Installing Java -----------------{NC}'
echo ''
echo ''

apt-get -y install default-jdk < "/dev/null"

echo ''
echo '${GREEN}----------- Java Successfully Installed! ----------------'
echo '------------ Cloning Blue0x Repository ------------{NC}'
echo ''

git clone https://github.com/theBlue0x/node.git

echo ''
echo '${GREEN}---------Successfully Cloned Blue0x Repo! ------------{NC}'
echo ''

cd node

echo ''
echo '${GREEN}--------- Compiling Blue0x ------------{NC}'
echo ''

./compile.sh

echo ''
echo '${GREEN}--------- Successfully Compiled Blue0x! ------------{NC}'
echo '$--------- Running Blue0x and Syncing Chain ------------{NC}'
echo ''

./run.sh --daemon
