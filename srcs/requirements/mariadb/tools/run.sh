#! /bin/bash

# export WORDPRESS_DB_HOST=db
# export MYSQL_ROOT_PASSWORD=kamiodl7lib
# export DATABASE=wordpress
# export USER=wordpress
# export USER_PASSWD=wordpress
# export ADMIN=ilahyani
# export ADMIN_PASSWD=admin123

service mysql start

echo "CREATE DATABASE ${DATABASE};" | mysql -u root

echo "CREATE USER '${USER}'@'localhost' IDENTIFIED BY '${USER_PASSWD}';" | mysql -u root

echo "GRANT ALL PRIVILEGES ON ${DATABASE}.* TO '${USER}'@'localhost' IDENTIFIED BY '${MYSQL_LOCAL_PASSWORD}';" | mysql -u root

echo "CREATE USER '${ADMIN}'@'%' IDENTIFIED BY '${ADMIN_PASSWD}';" | mysql -u root

echo "GRANT ALL PRIVILEGES ON *.* TO '${ADMIN}'@'%' IDENTIFIED BY '${ADMIN_PASSWD}';" | mysql -u root

echo "FLUSH PRIVILEGES;" | mysql -u root