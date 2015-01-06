#!/bin/bash

set -e
mysql_install_db --datadir=/var/lib/mysql
chown -R mysql:mysql /var/lib/mysql/
/usr/bin/mysqld_safe &
mysqladmin --silent --wait=30 ping || exit 1
# Grant rights for root user from everywhere
echo "GRANT ALL ON *.* TO root@'%'" | mysql
