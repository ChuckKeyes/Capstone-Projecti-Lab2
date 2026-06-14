aws ec2 describe-instances \
  --region ap-northeast-1 \
  --instance-ids i-0ff1967e66b115779 \
  --query 'Reservations[0].Instances[0].State.Name' \
  --output text
  