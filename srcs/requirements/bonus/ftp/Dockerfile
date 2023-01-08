FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y \
    && apt install vsftpd -y

COPY ./tools/run.sh /tmp/run.sh

RUN chmod +x tmp/run.sh

CMD ["/tmp/run.sh"]