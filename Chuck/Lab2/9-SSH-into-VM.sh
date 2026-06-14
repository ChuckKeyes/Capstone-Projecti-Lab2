# 9. SSH into VM
ssh -i japan-keypair.pem ubuntu@$PUBLIC_IP

sudo cp /tmp/index.html /var/www/html/
sudo cp -r /tmp/white-bread /tmp/wheat-bread /tmp/corn-bread /var/www/html/

ls -R /var/www/html

