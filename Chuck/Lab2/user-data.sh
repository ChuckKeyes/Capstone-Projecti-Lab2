#!/bin/bash
apt update
apt install -y nginx

systemctl enable nginx
systemctl start nginx

cat <<EOF > /var/www/html/index.html
<h1>Keyes Cloud Solutions</h1>
<p>Website deployed by Bash</p>
EOF