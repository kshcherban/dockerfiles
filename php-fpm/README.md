# PHP-FPM example with init

This container has php-fpm with simple application that writes date and sessions count to
fifo file. Everything is wrapped in bash script that watches php-fpm process.
Bash sends proper signals to php-fpm.
If php-fpm master process is gone then container dies despite there's `tail -f` running in background.
Also `docker stop` command properly kills php-fpm.

Check https://github.com/docker-library/php/issues/207 to see why tailf was added.

To build and test:

```
docker build -t test-php .
docker run --name test-php -ti --rm -p 9000:9000 test-php
```

In other terminal run:
```
apt-get install -y libfcgi0ldbl
REQUEST_METHOD=GET
REQUEST_URI=/
SCRIPT_FILENAME=/var/www/html/index.php
cgi-fcgi -bind -connect localhost:9000
docker stop test-php
```

You will see something like that:
```
[15-Feb-2018 16:43:04] NOTICE: fpm is running, pid 7
[15-Feb-2018 16:43:04] NOTICE: ready to handle connections
192.168.200.1 -  15/Feb/2018:16:43:06 +0000 "GET " 200
{"sessions":2,"date":"2018-02-15 16:43:06"}
SIGTERM received for process 7
[15-Feb-2018 16:43:20] NOTICE: Terminating ...
[15-Feb-2018 16:43:20] NOTICE: exiting, bye-bye!
```

And there's proper exit code from trap.
```
 └─$ echo $?
 0
```
