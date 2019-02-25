#!/bin/sh
#====================================================================
# build.sh
# ver 1.0  2019-1-6 12:15:51
#=====================Variable=======================================
PHP_NAME=c32_php:1.0
NGINX_NAME=c32_nginx:1.0
#====================================================================
#yum -y install 
#====================================================================
INST=`yum list installed | grep docker | wc -l`
if [ $INST -gt 1 ]
then
	echo "Docker Install Ok"
else
	echo "Start Install Docker"
	cd /tmp && wget http://c32.19aq.com/Linux/Docker/InstallDocker.sh
	chmod +x InstallDocker.sh
	./InstallDocker.sh
#install
fi
read -s -n1 -p "Pause ... "
# ====================PHP==============================================
cd ~ && mkdir docker && cd docker && mkdir PHP && cd PHP
rm -rf /root/docker/PHP/*.*
wget http://c32.19aq.com/Linux/Docker/PHP/Dockerfile
#docker build --no-cache -t $PHP_NAME .
# ====================MySQL==============================================
cd ~/docker && mkdir MySQL && cd MySQL
rm -rf /root/docker/MySQL/*.*
wget http://c32.19aq.com/Linux/Docker/MySQL/Dockerfile
# ====================Nginx==============================================
cd ~
mkdir /home/wwwroot
mkdir /home/wwwroot/html
cd /home/wwwroot/html
wget http://c32.19aq.com/Linux/Docker/Nginx/index1.html
mv index1.html index.html
pwd && ls -l && echo "||||||||||||==============================|||||||||||||||"
cd ~/docker && mkdir Nginx && cd Nginx
rm -rf /root/docker/Nginx/*.*
wget http://c32.19aq.com/Linux/Docker/Nginx/Dockerfile
pwd && ls -l && echo "||||||||||||==============================|||||||||||||||"
#docker build --no-cache -t $NGINX_NAME .
# -----------------------------------------------------------------------
cd /home
mkdir /home/nginx
mkdir /home/nginx/conf.d
cd /home/nginx/conf.d
rm -rf default.conf
wget http://c32.19aq.com/Linux/Docker/Nginx/default.conf
pwd && ls -l && echo "||||||||||||==============================|||||||||||||||"
# ====================DELETE===============================================
#docker rmi $(docker images nginx:1.15 | awk '{print $3}')
#docker rmi $(docker images mysql:5.7 | awk '{print $3}')
#docker rmi $(docker images php:7.0-fpm | awk '{print $3}')
# ====================RUN===============================================
cd ~/docker && rm -rf docker-compose.yml
wget http://c32.19aq.com/Linux/Docker/docker-compose.yml
#docker-compose up
docker-compose up --build