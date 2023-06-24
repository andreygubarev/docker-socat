# syntax=docker/dockerfile:1
FROM debian:bullseye-slim

RUN apt-get update &&  \
    apt-get install -yq --no-install-recommends \
        socat \
        tini && \
    rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENV SOCAT_BIND_TYPE=
ENV SOCAT_BIND_IFACE=
ENV SOCAT_BIND_OPTS=

ENV SOCAT_CONNECT_TYPE=
ENV SOCAT_CONNECT_IFACE=
ENV SOCAT_CONNECT_OPTS=

ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
