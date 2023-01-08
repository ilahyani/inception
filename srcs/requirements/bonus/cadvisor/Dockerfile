FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y \
    && apt install wget -y 

RUN wget https://github.com/google/cadvisor/releases/download/v0.37.0/cadvisor

RUN chmod +x cadvisor

CMD ["./cadvisor"]