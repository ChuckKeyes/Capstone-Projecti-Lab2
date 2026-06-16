# Lab 2 — EC2 Startup Script (User Data Automation)

## Overview

This lab uses a Bash startup script (User Data) to automatically configure an EC2 instance when it launches.

The script installs httpd, creates a simple website using HTML and CSS, and creates the required directories and files for the lab. Creates 4 dummy log files, placeholder files, and the copies for the website files in the `backups` directory.


Installs and starts `apache`
Creates a static website (`index.html` and `style.css`)

Creates project folders:
- content
- utils
- credentials
- backups
- logs


logs

# Execution

For validation I SSH'd into the EC2 instance, and checked if the directories were created properly

EC2 instance - SSH 
<img width="924" height="580" alt="ec2 ssh instance" src="https://github.com/user-attachments/assets/79752749-56e0-4eec-9df5-fbea808a5ff8" />


EC2 instance - AWS console
<img width="1576" height="130" alt="ec2 aws console" src="https://github.com/user-attachments/assets/049bd168-043b-4737-9f7b-062069d5eeee" />


EC2 - webpage
<img width="1839" height="960" alt="ec2 webpage" src="https://github.com/user-attachments/assets/4bc7a637-25e0-40bc-ab90-f5cdabe83b98" />

