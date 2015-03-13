#!/usr/bin/env bash

export MISC="/vagrant/src-env/misc"
export HADOOP_ETC="/usr/local/hadoop/hadoop-2.6.0/etc/hadoop"

cd /vagrant
[ -d tmp ] || mkdir tmp
cd tmp
[ -f jdk-8u40-linux-x64.tar.gz ] || wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u40-b25/jdk-8u40-linux-x64.tar.gz
[ -f hadoop-2.6.0.tar.gz ] || wget http://it.apache.contactlab.it/hadoop/common/hadoop-2.6.0/hadoop-2.6.0.tar.gz

echo -e "\n--- Updating packages list ---\n"
apt-get -qq update
apt-get install -y libc6-i386

[ -d /usr/local/java/ ] || mkdir /usr/local/java/
cd /usr/local/java/
tar xvf /vagrant/tmp/jdk-8u40-linux-x64.tar.gz

[ -d /usr/local/hadoop/ ] || mkdir /usr/local/hadoop/
cd /usr/local/hadoop/

tar xvf /vagrant/tmp/hadoop-2.6.0.tar.gz
sudo chown -R vagrant:vagrant /usr/local/hadoop
cat ${MISC}/.bashrc > /home/vagrant/.bashrc

cat ${MISC}/core-site.xml > ${HADOOP_ETC}/core-site.xml
cat ${MISC}/hdfs-site.xml > ${HADOOP_ETC}/hdfs-site.xml
cat ${MISC}/mapred-site.xml > ${HADOOP_ETC}/mapred-site.xml
cat ${MISC}/yarn-site.xml > ${HADOOP_ETC}/yarn-site.xml

if [ ! -f /home/vagrant/.ssh/id_dsa.pub ]; then

    su - vagrant -c "ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa"
    su - vagrant -c "cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys"

fi
