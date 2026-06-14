# 2. Create Security Group
WEB_SG_ID=$(aws ec2 create-security-group \
  --region $REGION \
  --group-name $SG_NAME \
  --description "Security group for bread website" \
  --vpc-id $VPC_ID \
  --query 'GroupId' \
  --output text)

echo $WEB_SG_ID


# WEB_SG_ID=$(aws ec2 create-security-group \
#   --group-name web-website-sg \
#   --description "Security group for website server" \
#   --vpc-id $VPC_ID \
#   --query 'GroupId' \
#   --output text)

# echo $WEB_SG_ID

# ###########################################################################
# #         To save the Security Group ID into a variable:

# WEB_SG_ID=$(aws ec2 create-security-group \
#   --group-name sg-web-website \
#   --description "Security group for website server" \
#   --vpc-id $VPC_ID \
#   --query 'GroupId' \
#   --output text)

# echo $WEB_SG_ID

#########################################################################


  #########################################################################

