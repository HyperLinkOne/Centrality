ARG PHP_VERSION=${PHP_VERSION:-8.4}
FROM php:${PHP_VERSION}-fpm
ENV TZ={$PHP_TIMEZONE:-'Europe/Berlin'}
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

RUN buildDeps="zlib1g-dev libxml2-dev libssl-dev libxslt-dev libc-client2007e-dev libkrb5-dev libgpgme11-dev libssh2-1 libssh2-1-dev libpng-dev libzip-dev libpq-dev default-mysql-client" \
&& apt-get update && apt-get -y install $buildDeps \
&& docker-php-ext-install pdo pdo_pgsql pgsql \
&& docker-php-ext-install zip \
&& docker-php-ext-install ftp \
&& docker-php-ext-install xsl \
&& docker-php-ext-install bcmath \
&& docker-php-ext-install gd \
&& docker-php-ext-install dom \
&& docker-php-ext-install sockets \
&& pecl install gnupg \
&& docker-php-ext-enable gnupg \
&& pecl install ssh2-1.3.1 \
&& docker-php-ext-enable ssh2 \
&& pecl install xdebug \
&& docker-php-ext-enable xdebug \
&& apt-get -y purge $buildDeps

RUN apt-get install -y libicu-dev \
    && apt-get install -y libcurl3-openssl-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-enable intl

RUN apt-get update && apt-get -y install curl git && apt-get clean \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer 

COPY docker/dev/php/*.ini /usr/local/etc/php/conf.d/

WORKDIR /var/www/html
EXPOSE 9000
# Standard CMD für den Container (hier PHP-FPM)
CMD ["php-fpm"]
