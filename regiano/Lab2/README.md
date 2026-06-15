# Lab 2 — EC2 Startup Script (User Data Automation)

## Overview


This lab uses a Bash startup script (User Data) to automatically configure an EC2 instance when it launches.

The script installs httpd, creates a simple website using HTML and CSS, and creates the required directories and files for the lab.


Installs and starts `apache`
Creates a static website (`index.html` and `style.css`)

Creates project folders:
- content
- utils
- credentials
- backups
- logs

Creates 4 dummy log files
Creates backups of the website files
Hosts the website through HTTP
Directory Structure

/project

content
utils
credentials
backups
logs

# Execution

For validation I SSH'd into the EC2 instance, and checked if the directories were created properly

EC2 instance - SSH 
![alt text](<ec2 ssh instance.png>)

EC2 instance - AWS console
![alt text](<ec2 aws console.png>)