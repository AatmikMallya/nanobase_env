#!/bin/bash
DEBIAN_FRONTEND=noninteractive apt-get -y install postfix
export DEBIAN_FRONTEND="noninteractive"

#for now, we're not going to install mysql with a password
#debconf-set-selections <<< 'mysql-server mysql-server/root_password password mysqlpass' 
#debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password mysqlpass'

sudo cp /usr/lib/python3/dist-packages/apt_pkg.cpython-38-x86_64-linux-gnu.so /usr/lib/python3/dist-packages/apt_pkg.so

apt-get update
apt-get -y install nginx
apt-get -y install gunicorn3
apt-get -y install cmake
apt-get -y install python3-pip
apt-get -y install build-essential
apt-get -y install mysql-server

#setup mysql
#need to be in /vagrant path for sql_setup.sql
cd /vagrant
echo "[mysqld]" >> /etc/mysql/my.cnf
echo "bind-address = 0.0.0.0" >> /etc/mysql/my.cnf
service mysql restart

echo "now setting mySQL authentication"
mysql -Bse "USE mysql; UPDATE user SET plugin='mysql_native_password' WHERE User='root'; FLUSH PRIVILEGES; SET global sql_mode='';"
mysql -Bse "CREATE USER 'root'@'%'; GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'; FLUSH PRIVILEGES";
#mysql -Bse "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'; FLUSH PRIVILEGES;"
mysql -Bse "DROP DATABASE IF EXISTS nanobase;"
mysql -Bse "CREATE DATABASE nanobase CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;"
mysql -Bse "source sql_setup.sql"
service mysql restart

#install python dependencies
add-apt-repository ppa:deadsnakes/ppa
apt-get update
apt-get -y install python3.7
update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 1
apt-get -y install python3.7-gdbm
apt-get remove python3-apt
apt-get install python3-apt
apt-get install python3-pip
pip3 install --upgrade pip
pip3 install bcrypt
pip3 install flask
pip3 install pathos
pip3 install yagmail
pip3 install pymysql
pip3 install pymysql-pool
pip3 install elasticsearch

#install elasticsearch
apt-get install default-jdk
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-7.x.list
apt-get update && sudo apt-get install elasticsearch

chown elasticsearch:elasticsearch -R /usr/share/elasticsearch
chown elasticsearch:elasticsearch -R /var/log/elasticsearch
chown elasticsearch:elasticsearch -R /var/lib/elasticsearch
chown elasticsearch:elasticsearch -R /etc/default/elasticsearch
chown elasticsearch:elasticsearch -R /etc/elasticsearch

echo "START_DAEMON=true" >> /etc/default/elasticsearch
echo "ES_USER=elasticsearch" >> /etc/default/elasticsearch
echo "ES_GROUP=elasticsearch" >> /etc/default/elasticsearch
#start elasticsearch
/bin/systemctl daemon-reload
/bin/systemctl enable elasticsearch.service
systemctl enable elasticsearch
systemctl start elasticsearch
#stop elasticsearch
# systemctl start elasticsearch.service
# systemctl stop elasticsearch.service

mkdir /users
chown vagrant /users

#move nginx config
cp /vagrant/nginx.conf /etc/nginx/nginx.conf
service nginx restart
