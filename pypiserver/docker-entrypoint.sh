#!/bin/bash

if [ "$1" = 'pypiserver' ]; then
    echo "[RUN]: Launching pypiserver"
    mkdir -p /data/packages
    touch /data/.htaccess
    exec pypi-server -p 80 -a update,download,list -P /data/.htaccess  /data/packages
fi

echo "[RUN]: Builtin command not provided [pypiserver]"
echo "[RUN]: $@"

exec "$@"
