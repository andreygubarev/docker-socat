#!/usr/bin/env sh
set -eux

if [ -n "${SOCAT_BIND_TYPE}" ] && [ -n "${SOCAT_BIND_IFACE}" ]; then
    if [ -n "${SOCAT_BIND_OPTS}" ]; then
        SOCAT_BIND_OPTS=",${SOCAT_BIND_OPTS}"
    fi
    SOCAT_BIND="${SOCAT_BIND_TYPE}:${SOCAT_BIND_IFACE}${SOCAT_BIND_OPTS}"
fi

if [ -z "${SOCAT_BIND}" ]; then
    echo "SOCAT_BIND is not configured (use SOCAT_BIND_TYPE, SOCAT_BIND_IFACE and SOCAT_BIND_OPTS)"
    exit 1
fi

if [ -n "${SOCAT_CONNECT_TYPE}" ] && [ -n "${SOCAT_CONNECT_IFACE}" ]; then
    if [ -n "${SOCAT_CONNECT_OPTS}" ]; then
        SOCAT_CONNECT_OPTS=",${SOCAT_CONNECT_OPTS}"
    fi
    SOCAT_CONNECT="${SOCAT_CONNECT_TYPE}:${SOCAT_CONNECT_IFACE}${SOCAT_CONNECT_OPTS}"
fi

if [ -z "${SOCAT_CONNECT}" ]; then
    echo "SOCAT_CONNECT is not configured (use SOCAT_CONNECT_TYPE, SOCAT_CONNECT_IFACE and SOCAT_CONNECT_OPTS)"
    exit 1
fi

socat "${SOCAT_BIND}" "${SOCAT_CONNECT}"
