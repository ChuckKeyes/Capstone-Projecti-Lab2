aws ec2 run-instances \
  --region $REGION \
  --image-id $AMI_ID \
  --instance-type t3.micro \
  --key-name $KEY_NAME \
  --security-group-ids $WEB_SG_ID \
  --subnet-id $SUBNET_ID \
  --associate-public-ip-address \
  --user-data file://user-data.sh