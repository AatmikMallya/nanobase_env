#!/bin/bash
export DEBIAN_FRONTEND="noninteractive"

#for now, we're not going to install mysql with a password
#debconf-set-selections <<< 'mysql-server mysql-server/root_password password mysqlpass' 
#debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password mysqlpass'

apt-get update
apt-get -y install nginx gunicorn3 cmake python3-pip build-essential mysql-server

#setup mysql
#need to be in /vagrant path for sql_setup.sql
cd /vagrant
echo "[mysqld]" >> /etc/mysql/my.cnf
echo "bind-address = 0.0.0.0" >> /etc/mysql/my.cnf
service mysql restart

echo "now setting mySQL authentication"
mysql -Bse "USE mysql; UPDATE user SET plugin='mysql_native_password' WHERE User='root'; FLUSH PRIVILEGES;"
mysql -Bse "CREATE USER 'root'@'%'; GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'; FLUSH PRIVILEGES";
#mysql -Bse "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'; FLUSH PRIVILEGES;"
mysql -Bse "CREATE DATABASE nanobase CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;"
mysql -Bse "source sql_setup.sql"
service mysql restart

#install python dependencies
add-apt-repository ppa:deadsnakes/ppa
apt-get update
apt-get -y install python3.7
update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 1
apt-get -y install python3.7-gdbm
pip3 install --upgrade pip
pip3 install bcrypt flask pathos yagmail pymysql pymysql-pool


mkdir /users
chown vagrant /users

#move nginx config
cp /vagrant/nginx.conf /etc/nginx/nginx.conf
service nginx restart
