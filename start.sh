#!/bin/bash

# Start MySQL service
service mysql start

# Wait for MySQL to start (check if port 3306 is available)
while ! mysqladmin ping --silent; do
    echo "Waiting for MySQL to be ready..."
    sleep 1
done

# Initialize the database with your init.sql file
mysql -u root -prootpassword < /docker-entrypoint-initdb.d/init.sql

# Start Apache in the foreground
apache2-foreground
