FROM debian:buster

RUN apt-get update && apt-get upgrade -y \
    && apt-get install php-fpm php-mysql -y \
    && apt-get install curl -y

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp \
    && chmod +x /usr/local/bin/wp

COPY tools/run.sh /tmp/run.sh

RUN chmod +x /tmp/run.sh

ENTRYPOINT ["/bin/bash", "/tmp/run.sh"]