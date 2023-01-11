FROM debian:buster

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y redis-server

RUN sed -i -r "s/127.0.0.1/0.0.0.0/" /etc/redis/redis.conf

CMD ["redis-server",  "--protected-mode", "no"]