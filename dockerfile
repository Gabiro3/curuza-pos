# Use the official PHP image as the base image
FROM php:8.0-apache

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Copy the current directory contents into the container
COPY . /var/www/html/

# Set proper permissions (optional, adjust if necessary)
RUN chown -R www-data:www-data /var/www/html

# Expose port 80
EXPOSE 80

# Run Apache in the foreground
CMD ["apache2-foreground"]
