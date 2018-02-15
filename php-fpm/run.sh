#!/bin/bash

/usr/local/sbin/php-fpm &
PID=$!

# wait for php-fpm process to die as docker stop sends kill signals very quickly
for sig in SIGINT SIGTERM SIGKILL SIGHUP; do
    trap "echo \"$sig received for process $PID\"; kill -$sig $PID && sleep 1; exit $?" $sig
done

# run tail in background as we need wait to be executed
# if wait goes before tail then tail never gets executed before trap
/usr/bin/tail -f $LOG_STREAM &

wait $PID
