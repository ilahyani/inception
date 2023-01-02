FROM debian:bullseye

RUN apt-get update \
    && apt-get install php-fpm php-mysql -y \
    # && apt-get install mariadb-client -y \
    && apt-get install curl -y

COPY tools/run.sh /tmp/run.sh

RUN chmod +x /tmp/run.sh

ENTRYPOINT ["/bin/bash", "/tmp/run.sh"]