#!/bin/bash

# Region
REGION="ap-northeast-1"

# DNS
HOSTED_ZONE_ID="Z0247703397I0ACTR7D96"
DOMAIN_NAME="keyescloudsolutions.com"
SUBDOMAIN="bread"
FQDN="${SUBDOMAIN}.${DOMAIN_NAME}"

# Existing Network
VPC_ID="vpc-0f08193db2f851cd5"
SUBNET_ID="subnet-0a146cfd4d6e145f8"

# New Key Pair
KEY_NAME="bread-keypair"

# Your IP
MY_IP="0.0.0.0/0"

# Names for resources to be created
SG_NAME="bread-website-sg"

# EC2
INSTANCE_NAME="website-server"
INSTANCE_TYPE="t3.micro"

# Website
WEB_ROOT="/var/www/html"
INDEX_FILE="index.html"

# AMI
AMI_ID="ami-0b53194d9d4d5cfea"

# AWS Account
ACCOUNT_ID=$(aws sts get-caller-identity \
  --query Account \
  --output text)