# Base Image
FROM centos

# Author
MAINTAINER c32 amd5@qq.com

RUN yum install -y wget

RUN wget http://c32.19aq.com/Linux/sh/sqlmap.sh && \
	chmod +x sqlmap.sh && \
	./sqlmap.sh