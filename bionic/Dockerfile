FROM ubuntu:bionic
LABEL maintainer="Gerben Geijteman <gerben@hyperized.net>"
LABEL description="A simple Ansible docker instance"
ARG version

RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && \
    apt-get install -y python3-pip && \
    pip3 install --upgrade setuptools && \
    pip3 install cryptography && \
    pip3 install ansible~=$version
