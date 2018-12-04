FROM python:alpine
LABEL maintainer="Gerben Geijteman <gerben@hyperized.net>"
LABEL description="A simple Ansible docker instance with Azure AZCopy"
ARG version
RUN apk --no-cache add \
      build-base \
      openssl-dev \
      libffi-dev \
      py-cffi \
      py-cryptography \
      git \
      openssh-client \
      libc6-compat \
      wget \
      tar \
      bash && \
    wget https://aka.ms/downloadazcopy-v10-linux && \
    tar -xvzf downloadazcopy-v10-linux && \
    cp azcopy_linux_amd64_10*/azcopy /usr/local/bin/ && \
    pip install --upgrade setuptools && \
    pip install cryptography && \
    pip install ansible~=$version && \
    apk del \
      build-base \
      openssl-dev \
      wget \
      tar \
      libffi-dev && \
    rm -rf /var/cache/apk/*
