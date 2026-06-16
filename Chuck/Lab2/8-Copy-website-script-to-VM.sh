#!/bin/bash

# 8. Copy website setup script to VM

set -e

source ./1a-variables.sh

PUBLIC_IP=$(cat public_ip.txt)

echo "Copying website setup script to VM..."

scp -i "${KEY_NAME}.pem" \
    user-data.sh \
    ubuntu@$PUBLIC_IP:/home/ubuntu/

echo "Script copied."

