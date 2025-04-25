#!/bin/bash

echo "=== Laravel Log ==="
tail -n 50 /var/www/html/storage/logs/laravel.log

echo -e "\n=== PHP Error Log ==="
tail -n 50 /var/www/html/storage/logs/php_errors.log

echo -e "\n=== Apache Error Log ==="
tail -n 50 /var/log/apache2/error.log

echo -e "\n=== Apache Access Log ==="
tail -n 50 /var/log/apache2/access.log 