#!/bin/bash

BLUE='\033[1;34m'
NC='\033[0m'
lanIp="$(hostname  -I | cut -f1 -d' ')";
wanIp="$(curl https://ipinfo.io/ip 2>/dev/null)";

echo ""
echo -e "${BLUE}Updating system packages... ${NC}"
echo ""

sudo apt update && sudo apt upgrade -y && sudo apt install git nginx certbot python3-certbot-nginx

sudo systemctl enable nginx > /dev/null 2>&1
echo ""
echo -e "${BLUE}Checking if Docker is installed... ${NC}"
echo ""

if command -v docker &> /dev/null; then
echo -e "${BLUE}Docker is already installed. ${NC}"

else
echo -e "${BLUE}Docker not installed. Installing now... ${NC}"
echo ""
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh 1> /dev/null

echo ""
fi

echo ""
echo -e "${BLUE}You now need to assign your Blue0x node a domain name."
echo -e "Go to https://www.duckdns.org/domains and create an account."
echo ""
read -p "When you are finished, press Enter to continue..." </dev/tty
echo ""
echo ""
echo ""
echo -e "Now choose a domain name for your Blue0x node and enter it into the 'sub domain' field."
echo -e "It can be anything you like.  Then hit 'add domain'."
echo ""
read -p "When you are finished, press Enter to continue..." </dev/tty
echo ""
echo ""
echo ""
echo -e "Now enter ${wanIp} into the 'current ip' field and hit 'update ip'."
echo ""
read -p "When you are finished, press Enter to continue..." </dev/tty
echo ""
echo ""
echo ""

domain_step() {
echo ""
read -p "Please enter the domain name that you chose? (i.e. blue0x.duckdns.org) "  domain </dev/tty
echo ""
}

domain_step 

while true; do
    read -p "You have entered ' ${domain} '. Is this correct? (y/n) " yn </dev/tty
    case $yn in
        [Yy]* ) 
        echo ""
        echo "Great! Setting up SSL certificates for your domain...";
        break;;
        [Nn]* ) 
        domain_step;;
        * )
        echo ""
        echo "Invalid response. Please answer y or n.";;
    esac
done

sudo cat > /etc/nginx/sites-available/${domain} << EOF
server {
    listen 80;
    listen [::]:80;

    server_name ${domain};
        
    location / {
        proxy_pass http://localhost:6876;
        include proxy_params;
    }
}
EOF

sudo ln -s /etc/nginx/sites-available/${domain} /etc/nginx/sites-enabled/
sudo certbot --nginx -d ${domain} </dev/tty
sudo systemctl restart nginx

echo ""
echo -e "${BLUE}Cloning the Blue0x repo... ${NC}"
echo ""

git clone https://github.com/theBlue0x/node_new.git </dev/tty

cd node_new

echo ""
echo -e "${BLUE}Building the Blue0x Docker container....${NC}"
echo ""

sudo docker build -t blue0x . 

echo ""
echo -e "${BLUE}Starting Blue0x....${NC}"
echo ""

sudo docker run -d --restart=unless-stopped --network=host --name blue0x blue0x

echo ""

echo -e "${BLUE}Blue0x is now running!"
echo ""
echo -e "Please allow a few minutes for the wallet to start..."
echo ""
echo -e "You can view your node here -> ${NC}https://${domain}/test"
echo ""
echo -e "${BLUE}To stop Blue0x, run ${NC}'sudo docker stop blue0x'"
echo ""
echo -e "${BLUE}That's it! You are all done."
echo ""
echo -e "You may close this window.${NC}"
echo ""


