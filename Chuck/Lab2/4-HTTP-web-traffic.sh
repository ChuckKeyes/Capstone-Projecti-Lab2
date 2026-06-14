# 4. Allow HTTP web traffic

aws ec2 authorize-security-group-ingress \
  --region $REGION \
  --group-id $WEB_SG_ID \
  --protocol tcp \
  --port 80 \
  --cidr 0.0.0.0/0

  #   HTTP:

