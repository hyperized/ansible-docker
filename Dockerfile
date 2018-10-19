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
      python3 && \
      if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/local/bin/python /usr/bin/python; fi && \
    pip install --upgrade setuptools && \
    pip install cryptography && \
    pip install ansible~=$version && \
    apk del \
      build-base \
      openssl-dev \
      libffi-dev && \
    rm -rf /var/cache/apk/*
