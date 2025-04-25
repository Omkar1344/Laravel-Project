#!/usr/bin/env bash
# exit on error
set -o errexit

# Install PHP and required extensions
apt-get update
apt-get install -y php8.2 php8.2-cli php8.2-common php8.2-curl php8.2-mbstring php8.2-mysql php8.2-xml php8.2-zip php8.2-gd php8.2-sqlite3

# Install Composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install dependencies
composer install --no-interaction --no-dev --optimize-autoloader

# Generate application key
php artisan key:generate

# Create storage link
php artisan storage:link

# Run migrations
php artisan migrate --force

# Seed the database
php artisan db:seed --force

# Build assets
npm install
npm run build 