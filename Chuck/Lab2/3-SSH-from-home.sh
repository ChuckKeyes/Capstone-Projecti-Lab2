# 3. Allow SSH from your IP

  #     SSH
clear
aws ec2 authorize-security-group-ingress \
  --region $REGION \
  --group-id $WEB_SG_ID \
  --protocol tcp \
  --port 22 \
  --cidr "73.107.137.224/32"