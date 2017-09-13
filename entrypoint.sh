#!/bin/bash
echo -n "   => Waiting for ${WAIT_SERVICE} on tcp port ${WAIT_PORT}"
CPT=0
while ! nc -z -w 1 ${WAIT_HOST} ${WAIT_PORT}; do
  ((CPT++))
  if [ ${CPT} -gt 60 ]; then
    echo " Timeout!"
    exit 1
  fi;
  sleep 1
  echo -n .
done
echo " Found!"
