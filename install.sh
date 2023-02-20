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

echo '---------- Updating system ----------------'

apt-get update

echo '---------- System successfully updated! ------------'
echo '---------- Installing Java -----------------'

apt-get install default-jdk

echo '----------- Java Successfully Installed ----------------'
echo '------------ Cloning Blue0x Repository ------------'

git clone https://github.com/theBlue0x/node.git

echo '---------Successfully Cloned Blue0x Repo ------------'

cd node

echo '--------- Compiling Blue0x ------------'

./compile.sh

echo '--------- Successfully Compiled Blue0x ------------'
echo '--------- Running Blue0x and Syncing Chain ------------'

./run.sh --daemon