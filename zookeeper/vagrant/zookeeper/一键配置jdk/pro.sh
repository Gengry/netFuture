# @Author: liming
# @Date:   2018-11-26 23:14:59
# @Last Modified by:   liming
# @Last Modified time: 23:15:05
# @urlblog idig8.com
# ���˹��ں�  ��̿�̫��

#!/bin/bash
SOFT_PATH=/opt/soft

if [ ! -d $SOFT_PATH ];then
mkdir $SOFT_PATH
else
echo "�ļ����Ѿ�����"
fi

yum install -y wget 
#install jdk1.8
cd $SOFT_PATH
wget wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u141-b15/336fa29ff2bb4ef291e347e091f7f4a7/jdk-8u141-linux-x64.tar.gz"
tar -zxvf jdk* -C $SOFT_PATH
cd jdk*
JAVA_HOME=`pwd` 



#׷�ӻ�������
echo "export JAVA_HOME=${JAVA_HOME}" >> /etc/profile
echo "export PATH=$""JAVA_HOME/bin:$""PATH" >> /etc/profile
source /etc/profile
#�����Ϣ
echo "-----source update-----"
echo "java version"
java -version
source /etc/profile