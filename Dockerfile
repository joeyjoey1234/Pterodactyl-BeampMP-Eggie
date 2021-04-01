FROM ubuntu:20.04

RUN apt-get update
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install dialog apt-utils -y
RUN apt-get -y dist-upgrade
RUN apt-get -y upgrade
RUN apt-get update --fix-missing

RUN apt -y update && apt -y install liblua5.3-0 libz-dev rapidjson-dev libcurl4-openssl-dev curl git make cmake g++ libboost1.71-dev libssl-dev libboost1.71-all-dev build-essential
RUN apt-get -y update
RUN apt -y install lua5.3-dev

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
