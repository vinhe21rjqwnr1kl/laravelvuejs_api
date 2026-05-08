FROM php:8.2-cli

RUN apt-get update && apt-get install -y \
    git unzip curl libsqlite3-dev nodejs npm

RUN docker-php-ext-install pdo pdo_sqlite

COPY . /app

WORKDIR /app

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN composer install --no-dev --optimize-autoloader

RUN npm install
RUN npm run build

RUN chmod -R 775 storage
RUN chmod -R 775 database

EXPOSE 10000

CMD php artisan serve --host=0.0.0.0 --port=10000