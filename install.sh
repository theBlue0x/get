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

apt-get update

apt-get install default-jdk

git clone https://github.com/theBlue0x/node.git

cd node

./compile.sh

./run.sh