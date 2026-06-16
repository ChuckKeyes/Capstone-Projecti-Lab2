#!/bin/bash


# 9. SSH into VM

set -e

source ./1a-variables.sh

PUBLIC_IP=$(cat public_ip.txt)

echo "Connecting to VM..."

ssh -i japan-keypair.pem ubuntu@$PUBLIC_IP

sudo cp /tmp/index.html /var/www/html/
sudo cp -r \
    /tmp/white-bread \
    /tmp/wheat-bread \
    /tmp/corn-bread \
    /var/www/html/

ls -R /var/www/html

sleep 5

sudo systemctl restart nginx
