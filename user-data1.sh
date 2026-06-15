#!/bin/bash

# 1. Install and start nginx 
yum update -y
yum install -y nginx
systemctl enable nginx
systemctl start nginx

# 2. Paste your copied Base64 string between the single quotes below
BASE64_HTML="UEsDBAoAAAAAAIi...[]..."

# 3. Decode the string directly into the web server directory
echo "$BASE64_HTML" | base64 --decode > /var/www/html/index.html

# 4. Set appropriate web server permissions
chown www-data:www-data /var/www/html/index.html
chmod 644 /var/www/html/index.html
