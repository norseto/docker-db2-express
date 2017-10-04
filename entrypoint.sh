#!/bin/sh
set -e

case "$1" in
  '')
    su - db2inst1 -c "sh /db2-setup.sh"
    /entrypoint_org.sh db2start
    ;;
  *)
    exec "$@"
    ;;
esac
