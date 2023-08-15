# Use the official PHP image as the base image
FROM php:8.1 as php

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    zip \
    libpq-dev\
    libcurl4-gnutls-dev\
    && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql

RUN pecl install -o -f redis \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable redis

# Set the working directory to /var/www
WORKDIR /var/www

# Copy the Laravel application files to the container
COPY . /var/www

#OR

#COPY . .

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ENV PORT=8000

ENTRYPOINT [ "docker/entrypoint.sh"]

