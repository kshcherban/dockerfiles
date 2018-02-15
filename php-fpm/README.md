# PHP-FPM example with init

This container has php-fpm with simple application that writes date and sessions count to
fifo file. Everything is wrapped in bash script that watches php-fpm process.
Bash sends proper signals to php-fpm.
If php-fpm master process is gone then container dies despite there's `tail -f` running in background.

To build and test:

```
docker build -t test-php .
docker run --name test-php -ti --rm -p 9000:9000 test-php

In other terminal run:
```
apt-get install -y libfcgi0ldbl
REQUEST_METHOD=GET REQUEST_URI=/ SCRIPT_FILENAME=/var/www/html/index.php cgi-fcgi -bind -connect localhost:9000
```
