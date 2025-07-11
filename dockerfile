# Step 1: Use the official PHP Apache image
FROM php:8.0-apache

# Step 2: Install necessary PHP extensions
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Step 3: Enable Apache mod_rewrite for URL rewriting
RUN a2enmod rewrite

# Step 4: Install MariaDB (MySQL)
RUN apt-get update && apt-get install -y \
    mariadb-server \
    && rm -rf /var/lib/apt/lists/*

# Step 5: Set environment variables for MySQL
ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=store_db
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=mypassword

# Step 6: Copy your PHP code and SQL initialization file into the container
COPY . /var/www/html/
COPY ./init.sql /docker-entrypoint-initdb.d/

# Step 7: Set the correct ownership for web files
RUN chown -R www-data:www-data /var/www/html

# Step 8: Set ServerName to avoid Apache warnings
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Step 9: Expose ports for Apache and MySQL (80 for HTTP, 3306 for MySQL)
EXPOSE 80 3306

# Step 10: Copy the start.sh script to the container and set it as executable
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Step 11: Use the start.sh script to initialize MySQL and start Apache
CMD ["/start.sh"]
