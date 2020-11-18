#!/bin/sh

mysql_install_db --datadir=/var/lib/mysql

/usr/bin/mysqld --user=root --datadir=/var/lib/mysql --bootstrap <<EOF
FLUSH PRIVILEGES;
CREATE DATABASE $MYSQL_DATABASE;
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO "$MYSQL_USER"@'%' IDENTIFIED BY "$MYSQL_PASSWORD";
FLUSH PRIVILEGES;
EOF

/usr/bin/mysqld_safe --datadir=/var/lib/mysql
