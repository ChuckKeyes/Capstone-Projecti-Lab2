#!/bin/bash

# 5. Find Ubuntu AMI

set -e

source ./1a-variables.sh

echo "Finding latest Ubuntu 22.04 AMI..."

AMI_ID=$(aws ec2 describe-images \
  --region "$REGION" \
  --owners 099720109477 \
  --filters "Name=name,Values=ubuntu/images/hvm-ssd-gp3/ubuntu-jammy-22.04-amd64-server-*" \
  --query 'Images | sort_by(@, &CreationDate)[-1].ImageId' \
  --output text)

echo "$AMI_ID" > ami_id.txt

echo "Ubuntu AMI found:"
echo "$AMI_ID"

