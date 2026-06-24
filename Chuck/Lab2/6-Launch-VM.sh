#!/bin/bash

# 6. Launch VM

set -e

source ./1a-variables.sh

WEB_SG_ID=$(cat web_sg_id.txt)
AMI_ID=$(cat ami_id.txt)

echo "Launching EC2 VM..."

INSTANCE_ID=$(aws ec2 run-instances \
  --region "$REGION" \
  --image-id "$AMI_ID" \
  --instance-type t3.micro \
  --key-name "$KEY_NAME" \
  --security-group-ids "$WEB_SG_ID" \
  --subnet-id "$SUBNET_ID" \
  --associate-public-ip-address \
  --user-data file://user-data.sh \
  --query 'Instances[0].InstanceId' \
  --output text)

echo "$INSTANCE_ID" > instance_id.txt


echo "Waiting for EC2 status checks..."

aws ec2 wait instance-status-ok \
  --region "$REGION" \
  --instance-ids "$INSTANCE_ID"

echo "Instance passed AWS status checks."

echo "VM created:"
echo "$INSTANCE_ID"



echo "VM should be ready now."
