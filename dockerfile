# Use the official PHP image as the base image
FROM php:8.0-apache

# Install MariaDB (MySQL replacement) and PHP extensions
RUN apt-get update && apt-get install -y \
    mariadb-server \
    && docker-php-ext-install pdo pdo_mysql mysqli \
    && apt-get clean

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Set environment variables for MariaDB
ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=mydatabase
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=mypassword

# Copy the current directory contents into the container
COPY . /var/www/html/

# Copy the init.sql script to the correct directory
COPY init.sql /docker-entrypoint-initdb.d/

# Set proper permissions for the copied files
RUN chown -R www-data:www-data /var/www/html

# Expose Apache and MariaDB ports
EXPOSE 80 3306

# Start MySQL and then Apache in the foreground
CMD service mysql start && \
    # Wait for MySQL to be fully initialized before running the script
    sleep 10 && \
    mysql -u root -prootpassword -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};" && \
    mysql -u root -prootpassword ${MYSQL_DATABASE} < /var/www/html/init.sql && \
    apache2-foreground
