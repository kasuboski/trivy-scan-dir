FROM ubuntu:bionic

RUN apt-get update && \
    apt-get -y install --no-install-recommends ack-grep curl ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
COPY scan-dir /usr/local/bin/scan-dir

WORKDIR /gitops

CMD ["scan-dir"]