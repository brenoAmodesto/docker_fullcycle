FROM php:8.1.18-fpm-alpine3.17

RUN apk add bash mysql-client

RUN docker-php-ext-install pdo pdo_mysql

WORKDIR /var/www

RUN rm -rf /var/www/html

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#COPY . /var/www
#RUN composer install && \
#            cp .env.example .env && \
#            php artisan key:generate && \
#            php artisan config:cache

#COPY . /var/www

RUN ln -s public html

EXPOSE 9000

ENTRYPOINT [ "php-fpm" ]

CMD php artisan serve --host=0.0.0.0

