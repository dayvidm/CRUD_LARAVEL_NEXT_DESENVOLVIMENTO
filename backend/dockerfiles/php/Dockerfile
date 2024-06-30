FROM php:8.3-fpm-alpine3.19

WORKDIR /var/www

# Install system dependencies
RUN apk add --no-cache \
    bash \
    curl \
    libpng-dev \
    libzip-dev \
    zlib-dev \
    postgresql-dev

# Install PHP extensions
RUN docker-php-ext-install gd \
    && docker-php-ext-install zip \
    && docker-php-ext-install pdo_pgsql

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer


# Copy application files
COPY . /var/www

# Install Composer dependencies
RUN composer install

# Generate application key
RUN php artisan key:generate

RUN chown -R www-data:www-data /var/www/storage \
    && chown -R www-data:www-data /var/www/bootstrap/cache \
    && chmod -R 775 /var/www/storage \
    && chmod -R 775 /var/www/bootstrap/cache


EXPOSE 9000
