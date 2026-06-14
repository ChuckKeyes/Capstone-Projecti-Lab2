aws ec2 run-instances \
  --region $REGION \
  --image-id ami-xxxxxxxx \
  --instance-type t3.micro \
  --key-name $KEY_NAME \
  --security-group-ids $WEB_SG_ID \
  --subnet-id $SUBNET_ID

  aws ec2 describe-key-pairs \
  --region ap-northeast-1 \
  --query 'KeyPairs[*].KeyName' \
  --output table

  REGION="ap-northeast-1"
SUBNET_ID="subnet-0a146cfd4d6e145f8"
WEB_SG_ID="sg-00d3007543bea2e4b"
KEY_NAME="japan-keypair"

AMI_ID=$(aws ec2 describe-images \
  --region $REGION \
  --owners 099720109477 \
  --filters "Name=name,Values=ubuntu/images/hvm-ssd-gp3/ubuntu-jammy-22.04-amd64-server-*" \
  --query 'Images | sort_by(@, &CreationDate)[-1].ImageId' \
  --output text)

echo $AMI_ID        #  ami-0b53194d9d4d5cfea

INSTANCE_ID=$(aws ec2 run-instances \
  --region $REGION \
  --image-id $AMI_ID \
  --instance-type t3.micro \
  --key-name $KEY_NAME \
  --security-group-ids $WEB_SG_ID \
  --subnet-id $SUBNET_ID \
  --associate-public-ip-address \
  --query 'Instances[0].InstanceId' \
  --output text)

echo $INSTANCE_ID