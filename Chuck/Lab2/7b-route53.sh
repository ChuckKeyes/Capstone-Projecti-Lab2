#!/bin/bash
set -e

source ./1a-variables.sh

echo "Creating DNS record..."

aws route53 change-resource-record-sets \
  --hosted-zone-id "$HOSTED_ZONE_ID" \
  --change-batch file://bread-dns.json

echo ""
echo "DNS record created:"
echo "$FQDN"
