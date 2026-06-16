#!/bin/bash

# Installs and starts Apache (httpd) for Amazon Linux server
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd

# Generates required folders
mkdir /Arma
mkdir /Arma/content
mkdir /Arma/utils
mkdir /Arma/credentials
mkdir /Arma/backups
mkdir /Arma/logs

# the 4 dummy files and placeholder files (notes, nonsense and bullish) in 3 directories (content, utils, and credentials)
touch /Arma/content/notes.txt
touch /Arma/utils/nonsense.txt
touch /Arma/credentials/bullish.txt

touch /Arma/logs/logs.txt
touch /Arma/logs/files.txt
touch /Arma/logs/test.txt
touch /Arma/logs/backups.txt


# Generate a custom HTML page
cat > /var/www/html/index.html << EOF
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AWS webserver</title>
    <link rel="stylesheet" href="style.css">
</head>

<h1>Cloud-Drifter Zeek!</h1>

<div class="services">
  <div class="feature">
    <h3>About Me:</h3>
    <p>My name is Omari Miller, an aspiring gradute of Theo University and future cloud specialist. Coming from a laboratory background, I am no stranger to the scientific method: the continuous, empirical process used to acquire knowledge, minimize bias and solve problems. Need I say more?
      
    </p>
  </div>
  <div class="feature">
    <h3>Project Description:</h3>
    <p>This lab introduces Linux automation and cloud initialization by writing a startup script that configures an EC2 instance to host a front-facing static website.
 Using Bash scripting, we will automate server setup without manual intervention.
      
    </p>
  </div>
  <div class="feature">
    <h3>Contact:</h3>
    <p>Email: Millertyme314@gmail.com
    <p>Facebook: Zeek Miller  
      
    </p>
  </div>
</div>

<p align="center">
  <img src="https://substack-post-media.s3.amazonaws.com/public/images/30e62d91-5853-44c9-bcec-ebdfe2b347eb_1536x1024.png" alt="Me Likey" width="250">
</p>
</html>
EOF

# Generate a CSS file
cat > /var/www/html/style.css << EOF

.services {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  column-gap: 20px;
}

.feature {
  border: 1px solid #0b02bd;
  color: red;
  padding: 15px;
  border-radius: 40px;
  font-family: sans-serif;
  
}

.feature h3 {
  color: #11b80b;
  background-color: white;
}

.feature p {
  color: #b8250b;
  background-color: black;
}

.feature h3{
  font-size: 1.5rem;
}

body {
  background-color: rgb(50, 100, 120);
}

EOF

# Copied server files are placed in backups directory
cp /var/www/html/index.html /Arma/backups/
cp /var/www/html/style.css /Arma/backups/