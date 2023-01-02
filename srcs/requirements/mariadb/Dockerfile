FROM debian:bullseye

RUN apt-get update

RUN apt-get install -y mariadb-server

COPY tools/run.sh /tmp/run.sh

RUN chmod +x /tmp/run.sh

ENTRYPOINT ["bash" , "/tmp/run.sh"]


