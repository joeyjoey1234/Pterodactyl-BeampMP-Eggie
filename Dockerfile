FROM ubuntu:18.04

RUN apt -y update && apt -y install liblua5.3-0 libz-dev rapidjson-dev libcurl4-openssl-dev curl git make cmake g++ libboost1.71-dev libssl-dev

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
