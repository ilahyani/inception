FROM debian:buster

RUN apt-get update && apt-get install -y \
    php php-mysql\
    wget

COPY ./tools/run.sh /tmp/run.sh

RUN chmod +x /tmp/run.sh

ENTRYPOINT ["/tmp/run.sh"]