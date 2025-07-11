#!/bin/bash

# Start MySQL in the background
mysqld_safe --datadir=/var/lib/mysql &

# Wait for MySQL to start (check if MySQL is accepting connections)
while ! mysqladmin ping --silent; do
    echo "Waiting for MySQL to be ready..."
    sleep 1
done

# Grant privileges to the root user (ensure root can connect from localhost)
mysql -u root -prootpassword -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'rootpassword' WITH GRANT OPTION;"

# Initialize the database with your init.sql file (only if the database is empty)
mysql -u root -prootpassword < /docker-entrypoint-initdb.d/init.sql

# Start Apache in the foreground
apache2-foreground
