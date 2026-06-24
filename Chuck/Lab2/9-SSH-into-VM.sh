#!/bin/bash


# 9. SSH into VM

set -e

source ./1a-variables.sh

PUBLIC_IP=$(cat public_ip.txt)

echo "Connecting to VM..."

ssh -i bread-keypair.pem ec2-user@"$PUBLIC_IP" << 'EOF'

sudo cp /tmp/index.html /usr/share/nginx/html/

sudo cp /tmp/index.html /var/www/html/
sudo cp -r \
    /tmp/white-bread \
    /tmp/wheat-bread \
    /tmp/corn-bread \
    /tmp/css \
    /usr/share/nginx/html/

ls -R /usr/share/nginx/html/

sleep 5

sudo systemctl restart nginx
