#!/bin/bash
PASS=`pwgen -s 70 1`
user=`pwgen 12 1`

mysql -uroot <<MYSQL_SCRIPT
CREATE DATABASE $user character set utf8mb4 collate utf8mb4_unicode_ci;
CREATE USER '$user'@'%' IDENTIFIED BY '$PASS';
GRANT ALL PRIVILEGES ON $user.* TO '$user'@'%';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

echo "MySQL crées."
echo "Username:   $user"
echo "Password:   $PASS"
