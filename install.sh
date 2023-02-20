#!/usr/bin/bash
GREEN=$'\e[0;32m'

clear
echo '
__________.__                _______          
\______   \  |  __ __   ____ \   _  \ ___  ___
 |    |  _/  | |  |  \_/ __ \/  /_\  \\  \/  /
 |    |   \  |_|  |  /\  ___/\  \_/   \>    < 
 |______  /____/____/  \___  >\_____  /__/\_ \
        \/                 \/       \/      \/
                                      
     --- Together. We Are the Bank. ---
'
echo -e '${GREEN}---------- Updating system ----------------'
echo ''

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
