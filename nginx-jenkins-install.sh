#! /bin/bash
# Instance Identity Metadata Reference - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-identity-documents.html
sudo su -
# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 5BA31D57EF5975CA
wget -q -O – https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add –
echo "deb [trusted=yes] https://pkg.jenkins.io/debian-stable binary/" > /etc/apt/sources.list.d/jenkins.list
# sudo dpkg --configure -a
# sudo apt-get -y --fix-broken install
# Unattended-Upgrade::Automatic-Reboot "false"
apt-get remove needrestart -y
apt update && apt -y upgrade
apt-get -y install openjdk-11-jdk nginx
java -version
nginx -v
apt-get -y install jenkins

systemctl status nginx  | grep Active
systemctl status jenkins  | grep Active
unlink /etc/nginx/sites-enabled/default
echo "upstream jenkins {
        server 127.0.0.1:8080;
}
server {
        listen 80 default_server;
        listen [::]:80  default_server;
        location / {
            proxy_pass http://jenkins;
            proxy_set_header Host \$host;
            proxy_set_header X-Real-IP \$remote_addr;
        }
}" > /etc/nginx/conf.d/jenkins.conf
nginx -t
systemctl reload nginx

# sudo -su jenkins
# cd /var/lib/jenkins/
# mkdir .aws