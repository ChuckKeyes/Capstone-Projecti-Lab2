# Lab 2 — EC2 Startup Script and Static Website Deployment

## Objective

The purpose of this lab was to deploy a public static website on an AWS EC2 instance using Bash automation. The project used EC2, Security Groups, SSH/SCP, Route53, Nginx, HTML, CSS, and Linux file management.

The final website was deployed successfully at:

http://bread.keyescloudsolutions.com/

## Project Summary

I created a bread recipe website with separate folders for white bread, wheat bread, and corn bread. The website files were copied from my local computer to an EC2 instance and served publicly through Nginx. Route53 was used to point the DNS name `bread.keyescloudsolutions.com` to the EC2 public IP address.

The project was organized into multiple Bash scripts instead of one large script. This made troubleshooting easier because each script handled one job, such as creating the security group, launching the VM, getting the public IP, copying files, and updating Route53.

## Problems Encountered and Fixes

### 1. Wrong or Missing AMI ID

One problem was that the AMI lookup script returned:

```text
None
```

This caused the EC2 launch command to fail with:

```text
InvalidAMIID.Malformed
Invalid id: "None"
```

The fix was to stop relying on the failed Ubuntu AMI search and use a known working Amazon Linux 2023 AMI ID directly:

```bash
AMI_ID="ami-0d71b1617df761282"
```

After saving that AMI ID into `ami_id.txt`, the EC2 launch script was able to create the VM.

### 2. Wrong SSH Username

At first, I used:

```bash
ubuntu@$PUBLIC_IP
```

That works for Ubuntu AMIs, but I switched to Amazon Linux 2023. Amazon Linux uses:

```bash
ec2-user@$PUBLIC_IP
```

The fix was to update the SSH and SCP commands from `ubuntu` to `ec2-user`.

### 3. Key Pair Problems

I had an SSH error:

```text
Permission denied (publickey,gssapi-keyex,gssapi-with-mic)
```

The EC2 instance was using a key pair that did not match my local `.pem` file. I created a new AWS key pair, downloaded the `.pem` file, placed it in the Lab2 folder, and updated my variables file:

```bash
KEY_NAME="bread-keypair"
```

Then I launched a new EC2 instance using the correct key pair.

### 4. Variable Not Changing

I tried to change the key name by typing:

```bash
KEY_NAME="bread-keypair"
```

This only changed the variable in the current terminal session. It did not update the script file.

The fix was to edit `1a-variables.sh` directly and change:

```bash
KEY_NAME="japan-keypair"
```

to:

```bash
KEY_NAME="bread-keypair"
```

### 5. Old Home IP Address

The security group allowed SSH only from my public IP address. When my IP changed, SSH access could fail.

The fix was to update:

```bash
MY_IP="46.183.108.130/32"
```

in the variables file and then apply the SSH security group rule again.

### 6. Copying Files Did Not Work

The `scp` command failed when I used the wrong Linux username. The original command was:

```bash
scp -i "${KEY_NAME}.pem" -r index.html white-bread wheat-bread corn-bread ubuntu@$PUBLIC_IP:/tmp/
```

The fix for Amazon Linux was:

```bash
scp -i "${KEY_NAME}.pem" -r index.html white-bread wheat-bread corn-bread ec2-user@$PUBLIC_IP:/tmp/
```

After that, the website files copied correctly to `/tmp`.

### 7. Nginx Was Not Installed

After copying the files, I tried to restart Nginx and received:

```text
Failed to restart nginx.service: Unit nginx.service not found.
```

This meant Nginx was not installed. The fix on Amazon Linux was:

```bash
sudo dnf update -y
sudo dnf install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx
```

After installing and starting Nginx, the web server worked.

### 8. Default Nginx Page Displayed Instead of My Website

After Nginx started, the browser showed the default Nginx welcome page instead of my bread website. The problem was that Amazon Linux Nginx was serving files from:

```text
/usr/share/nginx/html
```

but my website files were in:

```text
/var/www/html
```

The fix was to copy the website files into the correct Nginx directory:

```bash
sudo cp /var/www/html/index.html /usr/share/nginx/html/

sudo cp -r /var/www/html/white-bread /var/www/html/wheat-bread /var/www/html/corn-bread /usr/share/nginx/html/

sudo systemctl restart nginx
```

After this, the correct website appeared.

### 9. DNS / Route53 Update

Once the EC2 instance had a public IP address, I created a JSON file for Route53 and used:

```bash
aws route53 change-resource-record-sets \
  --hosted-zone-id "$HOSTED_ZONE_ID" \
  --change-batch file://bread-dns.json
```

This updated:

```text
bread.keyescloudsolutions.com
```

to point to the EC2 instance.

## Final Result

The website successfully loaded in the browser at:

```text
http://bread.keyescloudsolutions.com/
```

The website includes a homepage with three bread recipe sections:

* White Bread
* Wheat Bread
* Corn Bread

Each section uses its own folder, HTML page, image, recipe file, and supporting files.

## Lessons Learned

This lab showed that small configuration details matter in cloud deployments. The biggest lessons were:

* The AMI type determines the correct SSH username.
* The EC2 key pair must match the local `.pem` file.
* Variables must be changed inside the script file, not only in the terminal.
* Nginx document roots can differ between Ubuntu and Amazon Linux.
* Route53 needs the current public IP address.
* Breaking automation into smaller Bash scripts makes troubleshooting easier.

## Conclusion

The lab was completed successfully. The EC2 instance hosted a public website, the website files were copied and served through Nginx, and Route53 was configured so the website could be reached through a custom domain name.
