#!/bin/sh
#====================================================================
# InstallDocker.sh
# ver 1.0 2019-1-7 14:32:10
#=====================Variable=======================================
#删除系统旧的软件缓存
yum clean dbcache 
yum clean metadata 
yum clean rpmdb 
yum clean headers 
yum clean all 
#删除可能存在的旧的软件
INST=`yum list installed | grep docker | wc -l`
if [ $INST -gt 1 ]
then
	docker stop $(docker ps -a -q)
	docker rm $(docker ps -a -q)
	docker rmi $(docker images | grep "c32" | awk '{print $3}')
else
echo "Docker not exist"
fi
yum remove -y docker docker-common docker-selinux docker-engine
#替换系统源
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.bak
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
#解决下载软件包存在与预期不符的问题
yum --enablerepo=base clean metadata
#安装yum-config-manager
#增加docker源
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
yum --assumeno update
#安装docker所需的依赖环境
yum install -y yum-utils device-mapper-persistent-data lvm2 wget unzip git
#安装docker
yum install -y docker-ce
#启动docker
systemctl start docker
#设置docker开机启动
systemctl enable docker
#查看docker版本
docker version
#安装Docker-Compose
yum -y install epel-release
yum -y install python-pip
pip --default-timeout=200 install -U docker-compose
docker-compose -version