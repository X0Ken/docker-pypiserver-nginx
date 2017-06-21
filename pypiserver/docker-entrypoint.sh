#!/bin/bash

if [ "$1" = 'pypiserver' ]; then
    echo "[RUN]: Launching pypiserver"
    mkdir -p /data/packages
    touch /data/.htaccess
    exec gunicorn -w16 'pypiserver:app(root="/data/packages", password_file="/data/.htaccess")' -b 0.0.0.0:80
fi

echo "[RUN]: Builtin command not provided [pypiserver]"
echo "[RUN]: $@"

exec "$@"
