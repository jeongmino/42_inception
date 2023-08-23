#!/bin/sh

# Change the owner of the MySQL data directory to mysql user and group
chown -R mysql:mysql /var/lib/mysql

# Start MariaDB service
service mariadb start

# Give some time for the MariaDB service to start up
sleep 10

if [ ! -e /var/lib/mysql/$MYSQL_DATABASE ]; then
    # Ensure you're using the correct password options for the commands
    mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE"
    mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'"
    mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%'; FLUSH PRIVILEGES;"
    mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;"
fi

mysqladmin -uroot -p$MYSQL_ROOT_PASSWORD shutdown
exec mysqld_safe
