FROM python:alpine
LABEL maintainer="Gerben Geijteman <gerben@hyperized.net>"
LABEL description="A simple Ansible docker instance"
ARG version
RUN apk --no-cache add \
      build-base \
      gcc \
      musl-dev \
      python-dev \
      make \
      openssl-dev \
      libffi-dev \
      py-cffi \
      py-cryptography \
      git \
      openssh-client \
      bash && \
    pip install --upgrade setuptools && \
    pip install cryptography azure-cli && \
    pip install ansible~=$version && \
    apk del \
      build-base \
      openssl-dev \
      libffi-dev && \
    rm -rf /var/cache/apk/*
