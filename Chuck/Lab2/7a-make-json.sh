#!/bin/bash
set -e

source ./1a-variables.sh

PUBLIC_IP=$(cat public_ip.txt)

cat > bread-dns.json <<EOF
{
  "Changes": [
    {
      "Action": "UPSERT",
      "ResourceRecordSet": {
        "Name": "${FQDN}",
        "Type": "A",
        "TTL": 300,
        "ResourceRecords": [
          {
            "Value": "${PUBLIC_IP}"
          }
        ]
      }
    }
  ]
}
EOF

echo "bread-dns.json created."

