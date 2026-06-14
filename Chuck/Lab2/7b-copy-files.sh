scp -i japan-keypair.pem -r corn-bread \
ubuntu@$PUBLIC_IP:/tmp/

scp -i japan-keypair.pem -r wheat-bread \
ubuntu@$PUBLIC_IP:/tmp/

scp -i japan-keypair.pem -r white-bread \
ubuntu@$PUBLIC_IP:/tmp/


scp -i japan-keypair.pem -r \
index.html \
white-bread \
wheat-bread \
corn-bread \
ubuntu@$PUBLIC_IP:/tmp/