#!/bin/bash

# 7. Get public IP

set -e

source ./1a-variables.sh

INSTANCE_ID=$(cat instance_id.txt)

echo "Finding public IP for VM..."

PUBLIC_IP=$(aws ec2 describe-instances \
  --region "$REGION" \
  --instance-ids "$INSTANCE_ID" \
  --query 'Reservations[0].Instances[0].PublicIpAddress' \
  --output text)

echo "$PUBLIC_IP" > public_ip.txt

echo "Public IP:"
echo "$PUBLIC_IP"
