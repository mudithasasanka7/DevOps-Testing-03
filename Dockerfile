# Use official PHP image with extensions
FROM php:8.2-cli

# Set working directory
WORKDIR /var/www

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    zip \
    curl \
    libzip-dev \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    npm \
    nodejs \
    && docker-php-ext-install pdo pdo_mysql zip

# Install Composer (v2.8.1)
RUN curl -sS https://getcomposer.org/installer | php -- --version=2.8.1 && \
    mv composer.phar /usr/local/bin/composer

# Copy Laravel project files
COPY . .

# Install PHP & JS dependencies
RUN composer install && npm install && npm run build

# Run Laravel Artisan commands
RUN php artisan key:generate && php artisan migrate --force

# Expose Laravel development server port
EXPOSE 8080

# Start Laravel dev server
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8080"]
