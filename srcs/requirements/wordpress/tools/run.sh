#! /bin/bash

groupadd www-pub

usermod -aG www-pub www-data

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

chmod +x /usr/local/bin/wp

mkdir -p var/www/html

runuser -u www-data -- wp core download --allow-root --path=/var/www/html

runuser -u www-data -- wp core config --dbname=${DATABASE} --dbuser=${USER} --dbpass=${USER_PASSWD} --dbhost=${WORDPRESS_DB_HOST} --allow-root --path=/var/www/html --skip-check

runuser -u www-data -- wp core install --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_EMAIL} \
    --skip-email --allow-root --path=/var/www/html

runuser -u www-data -- wp user create ${WP_USER} ${WP_EMAIL} --role=author --user_pass=${WP_USER_PWD} --allow-root --path=/var/www/html

runuser -u www-data -- wp plugin update --all --allow-root --path=/var/www/html

runuser -u www-data -- wp plugin install redis-cache --activate --allow-root --path=/var/www/html

runuser -u www-data -- wp config set WP_REDIS_HOST redis --path=/var/www/html

runuser -u www-data -- wp config set WP_REDIS_PORT 6379 --path=/var/www/html

runuser -u www-data -- wp redis enable --allow-root --path=/var/www/html

chown -R www-data:www-pub /var/www

chmod 2775 /var/www

mkdir /run/php

/usr/sbin/php-fpm7.3 -F