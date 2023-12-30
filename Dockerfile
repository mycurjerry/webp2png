FROM php:8.0-apache

RUN apt-get update && apt-get install -y libwebp-dev && docker-php-ext-install gd

COPY ./src/ /var/www/html/

RUN echo "file_uploads = On
"          "upload_max_filesize = 50M
"          "post_max_size = 50M
"          "max_execution_time = 600
"     >> /usr/local/etc/php/conf.d/uploads.ini

EXPOSE 80
