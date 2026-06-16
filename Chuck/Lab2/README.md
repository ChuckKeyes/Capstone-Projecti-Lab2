Lab 2 — EC2 Startup Script (User Data Automation)
Objective
This lab introduces Linux automation and cloud initialization by writing a startup script that
configures an EC2 instance to host a front-facing static website.
You will use Bash scripting to automate server setup without manual intervention.

Technical Requirements
Environment
● AWS EC2 (Amazon Linux or Ubuntu)
● Script must be compatible with EC2 User Data
● No SSH configuration required for grading

Startup Script Requirements
Your script must:
● Be written in Bash
● Execute automatically at instance launch
● Perform the following tasks:
1. Install a web server (Apache or Nginx)
2. Create an HTML page
■ this must use a .html file and a .css file
3. Serve content publicly via HTTP
4. Create backup directories of all generated files
5. Create a log – archive directory and generate 4 dummy files into this directory

6. Create additional directories with placeholder files for the following:
■ content
■ utils
■ credentials
7. Once your EC2 instance is up and running, you will need to ssh into this server
via the AWS Console and use Linux to validate your directory structures were
created as intended

Web Page Content Requirements
The generated web page must include:
● Your name
● A background color or image
● At least one embedded image
● Three distinct content sections, such as:
○ About Me
○ Project Description
○ Contact / Footer

HTML and CSS must be separate files.

Deliverables
● Bash startup script file (startup.sh)
● Screenshot of:
○ Running EC2 instance

○ Rendered web page in browser
○ CLI activity on the EC2 Server
● Brief explanation of script logic

Evaluation Criteria

Area Weight
Script runs without errors 30%
Web page renders correctly 20%
Required page elements
present

20%

Script readability & comments 15%
Server structure 15%