 #! /bin/bash
apt -y update
apt install -y nginx
systemctl enable nginx --now