#!/bin/bash

set -e

echo "================================="
echo " Bread Website VM Build Starting "
echo "================================="

echo "Step 1 - Load variables"
source ./1a-variables.sh

echo "Region: $REGION"
echo "VPC: $VPC_ID"
echo "Subnet: $SUBNET_ID"
echo "FQDN: $FQDN"

echo "Step 2 - Create Security Group"
bash ./2-security-group.sh

echo "Step 3 - Allow SSH from home"
bash ./3-SSH-from-home.sh

echo "Step 4 - Allow HTTP web traffic"
bash ./4-HTTP-web-traffic.sh

echo "Step 5 - Get Ubuntu AMI"
bash ./5-Ubuntu-AMI.sh

echo "Step 6 - Launch VM"
bash ./6-Launch-VM.sh

echo "Step 7 - Get public IP"
bash ./7-Get-public-IP.sh

echo "Step 8 - Copy website files"
bash ./7b-copy-files.sh

echo "Step 9 - Route53 DNS"
bash ./7b-route53.sh

echo "================================="
echo " Bread Website VM Build Finished "
echo "================================="