#!/bin/bash
set -e

trap 'echo "SIGTERM recieved for process $PID"; kill $PID && sleep 3' TERM INT EXIT QUIT KILL
/usr/local/sbin/php-fpm &
PID=$!
/usr/bin/tail -f $LOG_STREAM &
wait $PID
