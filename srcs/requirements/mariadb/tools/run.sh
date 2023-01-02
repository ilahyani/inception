#! /bin/bash

# export WORDPRESS_DB_HOST=172.17.0.2:3306
# export MYSQL_ROOT_PASSWORD=rootpasswd
# export DATABASE=wordpress
# export USER=wordpress
# export USER_PASSWD=wordpress
# export DOMAIN_NAME=ilahyani.42.fr
# export WP_TITLE=website
# export WP_ADMIN=ilahyani
# export WP_ADMIN_PWD=adminpasswd
# export WP_ADMIN_EMAIL=lahyani799@gmail.com
# export WP_USER=smail
# export WP_EMAIL=ilahyani@student.1337.ma 
# export WP_USER_PWD=smailpasswd

sed -i 's/127.0.0.1/0.0.0.0/g' etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

echo "CREATE DATABASE ${DATABASE};" | mysql -u root

echo "CREATE USER '${USER}'@'%' IDENTIFIED BY '${USER_PASSWD}';" | mysql -u root

echo "GRANT ALL PRIVILEGES ON ${DATABASE}.* TO '${USER}'@'%' IDENTIFIED BY '${USER_PASSWD}';" | mysql -u root

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'; FLUSH PRIVILEGES;" | mysql -u root

mysqld_safe