#!/bin/sh
# -*- coding: utf-8 -*-
#====================================================================
# Usage   : Bash Release.sh
# Author  : c32
# Blog    : http://www.19aq.com/
# Team    : Roots Exploits Team
# System  : CentOS 7.5 x64
# Ver     : 1.0  2019-3-2 21:31:21
#============================mysql变量================================
path=$(cd `dirname $0`; pwd)
cd $path
git pull 2>&1
read -s -n1 -p "按任意键继续提交新版本 ... "
git add .
git commit -m "提交版本"
git push