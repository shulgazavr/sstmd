#!/bin/bash

#create watch-unit
cp watchlog/watchlog /etc/sysconfig/watchlog
cp watchlog/watchlog.timer /etc/systemd/system/watchlog.timer
cp watchlog/watchlog.service /etc/systemd/system/watchlog.service
cp watchlog/watchlog.sh /usr/local/bin/watchlog.sh
systemctl start watchlog.service
systemctl start watchlog.timer

#install spawn-fcgi
yum install -y epel-release 
yum install -y httpd spawn-fcgi php php-cli mod_fcgid
cp fsgi/spawn-fcgi /etc/sysconfig/spawn-fcgi
cp fsgi/spawn-fcgi.service /etc/systemd/system/spawn-fcgi.service
systemctl start spawn-fcgi.service

#add second unit
mv /etc/httpd/conf/httpd.conf /etc/httpd/conf/first.conf
cp apache2/second.conf /etc/httpd/conf/second.conf
cp apache2/httpd-first /etc/sysconfig/httpd-first
cp apache2/httpd-second /etc/sysconfig/httpd-second
cp apache2/httpd.service /usr/lib/systemd/system/httpd.service
systemctl start httpd@first
systemctl start httpd@second