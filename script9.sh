#!/bin/bash
yum update -y
yum install nginx -y
service nginx start
sed -i "s/Welcome to/Welcome to Shows-Server-3/g" /usr/share/nginx/html/index.html
mkdir /usr/share/nginx/html/shows
rsync -av --progress /usr/share/nginx/html /usr/share/nginx/html/shows --exclude /usr/share/nginx/html/shows