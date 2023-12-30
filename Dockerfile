FROM php:8.0-apache

# 安装所需的 PHP 扩展
RUN apt-get update && \
    apt-get install -y libwebp-dev && \
    docker-php-ext-install gd

# 将 PHP 脚本复制到 Apache 服务器的根目录
COPY ./src/ /var/www/html/

# Apache 配置以允许文件上传
RUN echo "file_uploads = On\n" \
         "upload_max_filesize = 50M\n" \
         "post_max_size = 50M\n" \
         "max_execution_time = 600\n" \
    > /usr/local/etc/php/conf.d/uploads.ini

# Apache 已经配置为在容器启动时自动启动
EXPOSE 80
