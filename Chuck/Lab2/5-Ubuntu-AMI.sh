#!/bin/bash
set -e

source ./1a-variables.sh

echo "Using Amazon Linux 2023 AMI..."

AMI_ID="ami-0d71b1617df761282"

echo "$AMI_ID" > ami_id.txt

echo "AMI saved:"
echo "$AMI_ID"
