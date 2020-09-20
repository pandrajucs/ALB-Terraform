#!/bin/bash
yum update -y
yum install nginx -y
service nginx start
sed -i "s/Welcome to/Welcome to Shows-Server-1/g" /usr/share/nginx/html/index.html
mkdir /usr/share/nginx/html/shows
rsync -aP --exclude=/shows /usr/share/nginx/html/* /usr/share/nginx/html/shows/
