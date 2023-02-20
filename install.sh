#!/usr/bin/bash
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

echo ''
echo ''
echo ''
echo '---------- Updating system ----------------'
echo ''
echo ''
echo ''


apt-get update

echo ''
echo ''
echo ''
echo '---------- System successfully updated! ------------'
echo ''
echo ''
echo ''
echo '---------- Installing Java -----------------'
echo ''
echo ''
echo ''

apt-get install default-jdk


echo ''
echo ''
echo ''
echo '----------- Java Successfully Installed ----------------'
echo ''
echo ''
echo ''
echo '------------ Cloning Blue0x Repository ------------'
echo ''
echo ''
echo ''

git clone https://github.com/theBlue0x/node.git

echo ''
echo ''
echo ''
echo '---------Successfully Cloned Blue0x Repo ------------'
echo ''
echo ''
echo ''

cd node

echo ''
echo ''
echo ''
echo '--------- Compiling Blue0x ------------'
echo ''
echo ''
echo ''

./compile.sh

echo ''
echo ''
echo ''
echo '--------- Successfully Compiled Blue0x ------------'
echo ''
echo ''
echo ''
echo '--------- Running Blue0x and Syncing Chain ------------'
echo ''
echo ''
echo ''

./run.sh --daemon
