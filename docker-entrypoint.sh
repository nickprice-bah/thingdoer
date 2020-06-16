#!/bin/bash

set -e

if [ "${1:0:1}" != '-' ]; then
  exec "$@"
fi

cd /opt/thingdoer
echo 'Running thingdoer'

exec python ./thingdoer.py