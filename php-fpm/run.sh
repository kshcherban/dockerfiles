#!/bin/bash

/usr/local/sbin/php-fpm &
PID=$!

# wait for php-fpm process to die as docker stop sends kill signals very quickly
for sig in SIGINT SIGTERM SIGKILL SIGHUP; do
    trap "echo \"$sig received for process $PID\"; kill -$sig $PID" $sig
done

# run tail in background as we need wait to be executed
# if wait goes before tail then tail never gets executed before trap
/usr/bin/tail -f $LOG_STREAM &

wait $PID
# Second `wait` is crucial. See [12.2.2. How Bash interprets traps](http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_12_02.html)
wait $PID
