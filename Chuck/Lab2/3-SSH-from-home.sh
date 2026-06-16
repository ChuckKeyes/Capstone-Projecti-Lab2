#!/bin/bash

# 3. Allow SSH from your IP

set -e

source ./1a-variables.sh

WEB_SG_ID=$(cat web_sg_id.txt)

echo "Opening SSH (22) from: $MY_IP"

aws ec2 authorize-security-group-ingress \
  --region "$REGION" \
  --group-id "$WEB_SG_ID" \
  --protocol tcp \
  --port 22 \
  --cidr "$MY_IP"

echo "SSH rule added."
