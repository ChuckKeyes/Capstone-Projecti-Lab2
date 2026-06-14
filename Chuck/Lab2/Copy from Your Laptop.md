scp -i japan-keypair.pem user-data.sh ubuntu@PUBLIC_IP:/home/ubuntu/

Then SSH in:

ssh -i japan-keypair.pem ec2-user@52.195.154.181

Run:

chmod +x user-data.sh
./user-data.sh
