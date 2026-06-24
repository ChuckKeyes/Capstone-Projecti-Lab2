#!/bin/bash
set -e

source ./1a-variables.sh

INSTANCE_ID=$(cat instance_id.txt)
WEB_SG_ID=$(cat web_sg_id.txt)

echo "Deleting Route53 record..."
aws route53 change-resource-record-sets \
  --hosted-zone-id "$HOSTED_ZONE_ID" \
  --change-batch file://bread-dns-delete.json || true

echo "Terminating VM..."
aws ec2 terminate-instances \
  --region "$REGION" \
  --instance-ids "$INSTANCE_ID"

echo "Waiting for VM to terminate..."
aws ec2 wait instance-terminated \
  --region "$REGION" \
  --instance-ids "$INSTANCE_ID"

echo "Deleting Security Group..."
aws ec2 delete-security-group \
  --region "$REGION" \
  --group-id "$WEB_SG_ID"

echo "Deleting local files..."
rm -f bread-dns.json
rm -f bread-dns-delete.json
rm -f instance_id.txt
rm -f public-ip.txt
rm -f web_sg_id.txt
rm -f ami_id.txt

echo "Lab 2 shutdown complete."