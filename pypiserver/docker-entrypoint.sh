#!/bin/bash

if [ "$1" = 'pypiserver' ]; then
    echo "[RUN]: Launching pypiserver"
    mkdir -p /data/packages
    touch /data/.htaccess
    if [ "${AUTH}" == "" ]; then
        AUTH_OPS=""
    else
        AUTH_OPS="-a ${AUTH} -P /data/.htaccess"
    fi
    exec pypi-server -p 80 ${AUTH_OPS} /data/packages
fi

echo "[RUN]: Builtin command not provided [pypiserver]"
echo "[RUN]: $@"

exec "$@"
