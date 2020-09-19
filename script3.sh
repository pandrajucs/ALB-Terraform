#!/bin/bash
yum update -y
yum install nginx -y
service nginx start
sed -i "s/Welcome to/Welcome to Home-Server-3/g" /usr/share/nginx/html/index.html