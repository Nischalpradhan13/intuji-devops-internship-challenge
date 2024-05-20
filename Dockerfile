# Use the official PHP image as base
FROM php:7.4-apache

# Copy source code to the container
COPY . /var/www/html/

# Expose port 80
EXPOSE 80
