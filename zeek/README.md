# Lab 2- EC2 Startup Script (User-Data Automation) -> [Bash]

## Description
This lab introduces Linux automation and cloud initialization by writing a startup script that configures an EC2 instance to host a front-facing static website. 
Bash scripting was used to automate the server setup without manual intervention.

## The Bash script begins by:
1. Installing and enabling an apache web server (httpd)
2. Generating a static website via HTML & CSS
3. Creating the requisite folders (content, utils, credentials), dummy logs (4), extra placeholder files (notes.txt, nonsense.txt, bullish.txt)
4. Places copies of server files into a backups folder
5. Script-generated folders/files can be listed ("ls") via SSH into the running EC2 instance.
- **Screenshots were taken during this procecss for the requisite deliverables (Webpage, SSH into EC2, functional AWS EC2 instance confirmation)**

## Deliverables:
- Bash Startup script
- Screenshot of SSH into EC2 instance (Confirm CLI activity and instance reliability)
- Screenshot of rendered webpage in browser (Proof of instance validity)
- Screenshot of Running EC2 instance


<p align="center">
  <img src="https://miro.medium.com/0*UwDYwkA4xVNXawF0.jpeg" alt="Me Likey" width="250">
</p>



