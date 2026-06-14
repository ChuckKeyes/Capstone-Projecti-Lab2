aws ec2 describe-key-pairs \
  --region $REGION \
  --query 'KeyPairs[*].KeyName' \
  --output table

  -------------------                                                                                                                  
|DescribeKeyPairs |
+-----------------+
|  jenkins-key    |
|  japan-keypair  |
+-----------------+

REGION="ap-northeast-1"
SUBNET_ID="subnet-0a146cfd4d6e145f8"
WEB_SG_ID="sg-00d3007543bea2e4b"
KEY_NAME="japan-keypair"