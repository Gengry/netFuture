﻿    
# @Author: liming
# @Date:   2019-05-02 00:16:59
# @Last Modified by:   liming
# @Last Modified time: 00:17:16
# @urlblog idig8.com
# 个人公众号  编程坑太多

#!/bin/bash
SOFT_PATH=/opt/soft

if [ ! -d $SOFT_PATH ];then
mkdir $SOFT_PATH
else
echo "文件夹已经存在"
fi

yum install -y wget 
#install jdk1.8
cd $SOFT_PATH
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u141-b15/336fa29ff2bb4ef291e347e091f7f4a7/jdk-8u141-linux-x64.tar.gz"
tar -zxvf jdk* -C $SOFT_PATH
cd jdk*
JAVA_HOME=`pwd` 

#install maven3.2.3
cd $SOFT_PATH
wget https://archive.apache.org/dist/maven/maven-3/3.2.3/binaries/apache-maven-3.2.3-bin.tar.gz
tar -zxvf apache-maven-3.2.3-bin.tar.gz -C $SOFT_PATH
mv apache-maven-3.2.3 maven-3.2.3
cd maven*
MAVEN_HOME=`pwd`

#install git 2.8.0
cd $SOFT_PATH
yum -y install zlib-devel openssl-devel cpio expat-devel gettext-devel curl-devel perl-ExtUtils-CBuilder perl-ExtUtils- MakeMaker
wget https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.8.0.tar.gz
tar -zxvf git-2.8.0.tar.gz -C $SOFT_PATH
cd git*
./configure
make install
ln -s /usr/local/bin/git /usr/bin/git

#追加环境变量
echo "export JAVA_HOME=${JAVA_HOME}" >> /etc/profile
echo "export PATH=$""JAVA_HOME/bin:$""PATH" >> /etc/profile
echo "export MAVEN_HOME=${MAVEN_HOME}" >> /etc/profile
echo "export PATH=$""MAVEN_HOME/bin:$""PATH" >> /etc/profile
source /etc/profile
#输出信息
echo "-----source update-----"
echo "java version"
java -version
echo "maven version"
mvn -v
echo "-----path-----"
echo "JAVA_HOME:"$JAVA_HOME
echo "MAVEN_HOME:"$MAVEN_HOME
source /etc/profile
source /etc/profile
source /etc/profile

#关闭iptables
systemctl disable firewalld

#关闭selinux
if [ `getenforce` == 'Enforcing' ];then
    setenforce 0
    sed -i 's/^SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
fi



cd /root
#下载jenkins
wget https://mirrors.tuna.tsinghua.edu.cn/jenkins/war-stable/2.138.3/jenkins.war
#启动jenkins
nohup java -jar jenkins.war --ajp13Port=-1 --httpPort=8888 &