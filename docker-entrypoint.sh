#!/bin/sh
chown -R filebeat /config-dir

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- filebeat "$@"
fi

# Run as user "filebeat" if the command is "filebeat"
# allow the container to be started with `--user`
if [ "$1" = 'filebeat' -a "$(id -u)" = '0' ]; then
	set -- su-exec filebeat "$@"
fi

exec "$@"
