#!/bin/bash

wget https://www.adminer.org/latest.php -O /var/www/html/index.php
cd /var/www/html
php -S 0.0.0.0:5001