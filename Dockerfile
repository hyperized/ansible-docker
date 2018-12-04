FROM hyperized/azcopy as azcopy

FROM python:alpine
LABEL maintainer="Gerben Geijteman <gerben@hyperized.net>"
LABEL description="A simple Ansible docker instance with Azure AZCopy"
ARG version
COPY --from=azcopy /app/azcopy /usr/bin/azcopy
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
