#!/bin/bash

# 1. Variables
REGION="ap-northeast-1"
REGION="ap-northeast-1"
HOSTED_ZONE_ID="Z0247703397I0ACTR7D96"
DOMAIN_NAME="keyescloudsolutions.com"
SUBDOMAIN="bread"
FQDN="${SUBDOMAIN}.${DOMAIN_NAME}"

VPC_ID="vpc-0f08193db2f851cd5"
SUBNET_ID="subnet-0a146cfd4d6e145f8"
KEY_NAME="bread-keypair"
MY_IP="46.183.108.130/32"
SG_NAME="bread-website-sg"

AMI_ID=""
WEB_SG_ID=""
INSTANCE_ID=""
PUBLIC_IP=""
WEB_SG_ID=""


# Region
REGION="ap-northeast-1"

# AWS Account
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

# Project
PROJECT_NAME="vm-website"

# Network
VPC_ID="vpc-0f08193db2f851cd5"
PUBLIC_SUBNET_ID="subnet-xxxxxxxx"

# Security Group
WEB_SG_NAME="sg-web-website"

# EC2
INSTANCE_NAME="website-server"
INSTANCE_TYPE="t3.micro"
KEY_NAME="website-key"

# S3
BUCKET_NAME="keyescloudsolutions-website"

# Route53
DOMAIN_NAME="keyescloudsolutions.com"
SUBDOMAIN="labs"

# Full DNS Name
FQDN="${SUBDOMAIN}.${DOMAIN_NAME}"

# IAM
ROLE_NAME="website-ec2-role"
PROFILE_NAME="website-instance-profile"

# Website Files
WEB_ROOT="/var/www/html"
INDEX_FILE="index.html"

REGION="ap-northeast-1"
SUBNET_ID="subnet-0a146cfd4d6e145f8"
WEB_SG_ID="sg-00d3007543bea2e4b"

ACCOUNT_ID=$(aws sts get-caller-identity \
  --query Account \
  --output text)

  AMI_ID="ami-0b53194d9d4d5cfea"

  INSTANCE_ID=$(aws ec2 run-instances \
  --region $REGION \
  --image-id $AMI_ID \
  --instance-type t3.micro \
  --key-name $KEY_NAME \
  --security-group-ids $WEB_SG_ID \
  --subnet-id $SUBNET_ID \
  --associate-public-ip-address \
  --query 'Instances[0].InstanceId' \
  --output text)

echo $INSTANCE_ID           # i-0ff1967e66b115779

echo "REGION=$REGION"
echo "AMI_ID=$AMI_ID"
echo "KEY_NAME=$KEY_NAME"
echo "WEB_SG_ID=$WEB_SG_ID"
echo "SUBNET_ID=$SUBNET_ID"