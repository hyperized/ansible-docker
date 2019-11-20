FROM hyperized/scratch:latest as trigger
# Used to trigger Docker hubs auto build, which it wont do on the official images


FROM python:alpine

LABEL maintainer="Gerben Geijteman <gerben@hyperized.net>"
LABEL description="A simple Ansible docker instance"

ARG version

RUN apk --no-cache add \
      build-base \
      openssl-dev \
      libffi-dev \
      py-cffi \
      py-cryptography \
      git \
      openssh-client \
      bash && \
    pip install --upgrade setuptools && \
    pip install cryptography && \
    pip install ansible~=$version && \
    apk del \
      build-base \
      openssl-dev \
      libffi-dev && \
    rm -rf /var/cache/apk/*
