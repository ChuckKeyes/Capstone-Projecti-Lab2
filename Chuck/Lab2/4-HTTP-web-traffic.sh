#!/bin/bash

# 4. Allow HTTP web traffic

set -e

source ./1a-variables.sh

WEB_SG_ID=$(cat web_sg_id.txt)

echo "Opening HTTP (80) to the world..."

aws ec2 authorize-security-group-ingress \
  --region "$REGION" \
  --group-id "$WEB_SG_ID" \
  --protocol tcp \
  --port 80 \
  --cidr "0.0.0.0/0"

echo "HTTP rule added."

aws ec2 authorize-security-group-ingress \
  --region "$REGION" \
  --group-id "$WEB_SG_ID" \
  --protocol tcp \
  --port 443 \
  --cidr "0.0.0.0/0"

echo "HTTPS rule added."
