#!/bin/bash
set -e

source ./1a-variables.sh

PUBLIC_IP=$(cat public_ip.txt)

echo "Copying website files to VM..."

scp -i "${KEY_NAME}.pem" -r \
    index.html \
    white-bread \
    wheat-bread \
    corn-bread \
    css \
    ec2-user@$PUBLIC_IP:/tmp/

echo "Files copied."
