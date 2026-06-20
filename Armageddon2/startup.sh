#!/bin/bash

# installs neccessary components on startupf fro the webserver, installs httpd
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd

# makes the folders needed
mkdir /Chris.lab2
mkdir /Chris.lab2/content
mkdir /Chris.lab2/utils
mkdir /Chris.lab2/credentials
mkdir /Chris.lab2/backups
mkdir /Chris.lab2/logs

# the 4 dummy files and placeholder files in content, utils, and credentials
touch /Chris.lab2/content/spreadsheet.txt
touch /Chris.lab2/utils/extra.txt
touch /Chris.lab2/credentials/key.txt

touch /Chris.lab2/logs/logs.txt
touch /Chris.lab2/logs/files.txt
touch /Chris.lab2/logs/test.txt
touch /Chris.lab2/logs/backups.txt


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

    <h1>Christopher Alonzo</h1>

    <h2>About Me</h2>
    <p>To gather the necessary skills to obtain a cloud position.</p>

    <h2>Project Description</h2>
    <p>This lab is meant to introduce Linux and cloud initialization, by creating a startup script that
    configures, and automates the process of hosting a front-facing static website on an EC2 instance.</p>

    <h2>Contact</h2>
    <p>Email: stephfiredbyunderarmor1@gmail.com
    Facebook: Christopher Alonzo
    Discord: chris_92789</p>

    <img src="https://png.pngtree.com/png-clipart/20240508/original/pngtree-vector-of-cartoon-character-mascot-costume-animal-rocket-cute-robot-elephant-png-image_15042277.png" width="250">

</body>
</html>
EOF

# creates CSS file
cat > /var/www/html/style.css << EOF

body {
    background-color: grey;
    text-align: center;
    font-family: Times New Roman, serif;
}

h1 {
    color: black;
}

h2 {
    color: white;
}

EOF

# copies for website files saved in backups directory
cp /var/www/html/index.html /Chris.lab2/backups/
cp /var/www/html/style.css /Chris.lab2/backups/