FROM php:8.0-apache

# 将 PHP 脚本复制到 Apache 服务器的根目录
COPY ./src/ /var/www/html/

# 配置 PHP 以允许文件上传
RUN echo "file_uploads = On\n" \
         "upload_max_filesize = 50M\n" \
         "post_max_size = 50M\n" \
         "max_execution_time = 600\n" \
    > /usr/local/etc/php/conf.d/uploads.ini

EXPOSE 80
