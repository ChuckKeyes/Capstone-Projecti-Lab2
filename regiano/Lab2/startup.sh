#!/bin/bash

# installs neccessary components on startupf fro the webserver, installs httpd
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd

# makes the folders needed
mkdir /project
mkdir /project/content
mkdir /project/utils
mkdir /project/credentials
mkdir /project/backups
mkdir /project/logs

# the 4 dummy files
touch /project/logs/logs.txt
touch /project/logs/files.txt
touch /project/logs/test.txt
touch /project/logs/backups.txt


# HTML page
cat > /var/www/html/index.html << EOF
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AWS webserver</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

    <h1>Regiano Hortencia</h1>

    <h2>About Me</h2>
    <p>A young aspiring IT trainee that's interested in IT and Cloud, and would like to broaden my knowledge, so I can be an IT professional, and potentially start my own business in the future. That way, I can eat pizza and watch Formula 1 all day.</p>

    <h2>Project Description</h2>
    <p>This lab is meant to introduce Linux and cloud initialization, by creating a startup script that
    configures, and automates the process of hosting a front-facing static website on an EC2 instance.</p>

    <h2>Contact</h2>
    <p>Email: reggiano333@gmail.com
    Facebook: Regiano Hortencia
    Discord: L3gacy</p>

    <img src="https://cdn.magicdecor.in/com/2025/01/22172354/Red-Formula-One-Car-Wallpaper-Mural.jpg" width="250">

</body>
</html>
EOF

# creates CSS file
cat > /var/www/html/style.css << EOF

body {
    background-color: lightblue;
    text-align: center;
    font-family: Arial;
}

h1 {
    color: yellow;
}

h2 {
    color: red;
}

EOF

# copies for website files saved in backups directory
cp /var/www/html/index.html /project/backups/
cp /var/www/html/style.css /project/backups/