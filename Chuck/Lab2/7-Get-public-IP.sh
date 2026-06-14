# 7. Get public IP
PUBLIC_IP=$(aws ec2 describe-instances \
  --region $REGION \
  --instance-ids $INSTANCE_ID \
  --query 'Reservations[0].Instances[0].PublicIpAddress' \
  --output text)

echo $PUBLIC_IP