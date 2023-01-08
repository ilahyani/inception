#! /bin/bash

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

chmod +x /usr/local/bin/wp

mkdir -p var/www/html

wp core download --allow-root --path=/var/www/html

wp core config --dbname=${DATABASE} --dbuser=${USER} --dbpass=${USER_PASSWD} --dbhost=${WORDPRESS_DB_HOST} --allow-root --path=/var/www/html --skip-check

wp core install --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_EMAIL} \
    --skip-email --allow-root --path=/var/www/html

wp user create ${WP_USER} ${WP_EMAIL} --role=author --user_pass=${WP_USER_PWD} --allow-root --path=/var/www/html

wp plugin install redis-cache --activate --allow-root

wp config set WP_REDIS_HOST redis

wp config set WP_REDIS_PORT 6379

wp redis enable --allow-root

mkdir /run/php

/usr/sbin/php-fpm7.3 -F