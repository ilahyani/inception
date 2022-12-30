#! /bin/bash

export WORDPRESS_DB_HOST=db
export MYSQL_ROOT_PASSWORD=kamiodl7lib
export DATABASE=wordpress
export USER=wordpress
export USER_PASSWD=wordpress
export MYSQL_ALLOW_EMPTY_PASSWORD=yes

service mysql start

echo "CREATE DATABASE ${DATABASE};" | mysql -u root

echo "CREATE USER '${USER}'@'localhost' IDENTIFIED BY '${USER_PASSWD}';" | mysql -u root

echo "GRANT ALL PRIVILEGES ON ${DATABASE}.* TO '${USER}'@'localhost' IDENTIFIED BY '${MYSQL_LOCAL_PASSWORD}';" | mysql -u root

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'; FLUSH PRIVILEGES;" | mysql -u root