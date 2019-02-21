# Base Image
FROM mysql:5.7

# Author
MAINTAINER c32 amd5@qq.com

# Add to docker and Unpacking
#ADD http://c32.19aq.com/Linux/Docker/Nginx/default.conf /etc/nginx/conf.d/
#ADD http://c32.19aq.com/Linux/Docker/Nginx/index1.html /usr/share/nginx/html/index.html
#RUN cd /usr/share/nginx/ && chmod 755 -R html

# setting time
#ENV TZ=Asia/Shanghai
#RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


# install configure
#COPY ./pkg/redis.tgz /home/redis.tgz
#COPY ./pkg/cphalcon.tar.gz /home/cphalcon.tar.gz
# install Redis
#RUN pecl install /home/redis.tgz && echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini
