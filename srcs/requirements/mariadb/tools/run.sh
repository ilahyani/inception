#! /bin/bash

export DATABASE=wpdatabase
export LOCAL=local
export LOCAL_PASSWD=local
export ADMIN=ilahyani
export ADMIN_PASSWD=admin
export MYSQL_ALLOW_EMPTY_PASSWORD=yes

service mysql start

echo "CREATE DATABASE ${DATABASE};" | mysql -u root

echo "CREATE USER '${LOCAL}'@'localhost' IDENTIFIED BY '${LOCAL_PASSWD}';" | mysql -u root

echo "GRANT ALL PRIVILEGES ON ${DATABASE}.* TO '${LOCAL}'@'localhost' IDENTIFIED BY '${MYSQL_LOCAL_PASSWORD}';" | mysql -u root

echo "CREATE USER '${ADMIN}'@'%' IDENTIFIED BY '${ADMIN_PASSWD}';" | mysql -u root

echo "GRANT ALL PRIVILEGES ON *.* TO '${ADMIN}'@'%' IDENTIFIED BY '${ADMIN_PASSWD}';" | mysql -u root

echo "FLUSH PRIVILEGES;" | mysql -u root