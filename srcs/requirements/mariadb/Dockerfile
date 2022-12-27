FROM debian:buster

RUN apt-get update

RUN apt-get install -y mariadb-server

COPY tools/run.sh /tmp/run.sh

RUN chmod +x /tmp/run.sh

RUN /bin/bash /tmp/run.sh

ENTRYPOINT ["mysqld_safe"]
