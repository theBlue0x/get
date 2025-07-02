#!/bin/bash

BLUE='\033[1;34m'
NC='\033[0m'
lanIp="$(hostname  -I | cut -f1 -d' ')";
wanIp="$(curl https://ipinfo.io/ip 2>/dev/null)";

echo ""
echo -e "${BLUE}Updating system packages....${NC}"
echo ""

sudo apt update && sudo apt upgrade -y && sudo apt install git

echo ""
echo -e "${BLUE}Installing Java....${NC}"
echo ""

# Install Azul JDK 11 

curl -L --output zulu11.76.21-ca-jdk11.0.25-linux_amd64.deb https://cdn.azul.com/zulu/bin/zulu11.76.21-ca-jdk11.0.25-linux_amd64.deb
sudo apt install ./zulu11.76.21-ca-jdk11.0.25-linux_amd64.deb

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
    read -p "You have entered ${domain}.  Is this correct? (y/n) " yn </dev/tty
    case $yn in
        [Yy]* ) echo "Great! Setting up SSL certificates for your domain..."; break;;
        [Nn]* ) domain_step;;
        * ) echo "Please answer yes or no.";;
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
sudo certbot --nginx -d ${domain}
sudo systemctl restart nginx

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
echo -e "Please allow a few minutes for the node to start..."
echo ""
echo -e "You can view your node here -> ${NC}http://${wanIp}:6876"
echo ""
echo -e "${BLUE}To stop Blue0x, run ${NC}'sh stop.sh'"
echo ""
echo -e "${BLUE}You are all done. You may close this window.${NC}"
echo ""
