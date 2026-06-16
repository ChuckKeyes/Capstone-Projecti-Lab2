#!/bin/bash
sudo cp /tmp/index.html /var/www/html/

# 9. SSH into VM

set -e

source ./1a-variables.sh

PUBLIC_IP=$(cat public_ip.txt)

echo "Connecting to VM..."

ssh -i bread-keypair.pem ec2-user@13.231.225.210

sudo cp /tmp/index.html /var/www/html/
sudo cp -r \
    /tmp/white-bread \
    /tmp/wheat-bread \
    /tmp/corn-bread \
    /var/www/html/

ls -R /var/www/html

sleep 5

sudo systemctl restart nginx
