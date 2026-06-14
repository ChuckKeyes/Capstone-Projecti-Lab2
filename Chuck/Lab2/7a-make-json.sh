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
