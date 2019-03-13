# Base Image
FROM php:7.0-fpm

# Author
MAINTAINER c32 amd5@qq.com

# System commod
#RUN apt-get update && apt-get install -y \
#        libfreetype6-dev \
#        libjpeg62-turbo-dev \
#        libpng-dev \
#    && docker-php-ext-install -j$(nproc) iconv \
#    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
#    && docker-php-ext-install -j$(nproc) gd

# setting time
ENV TZ=AsiaShanghai
RUN ln -snf usrsharezoneinfo$TZ etclocaltime && echo $TZ  etctimezone
RUN docker-php-ext-install pdo_mysql
#RUN docker-php-ext-install gd
#RUN docker-php-ext-install redis
#RUN docker-php-ext-install bcmath  #YoShop 萤火虫商城