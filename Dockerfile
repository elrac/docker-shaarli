FROM php:5.6-apache

RUN apt-get -y update && LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y \
	wget \
	libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev 
RUN docker-php-ext-install iconv mcrypt 
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ 
RUN docker-php-ext-configure mbstring
RUN docker-php-ext-install gd mbstring


WORKDIR /var/www/html

ENV VERSION 0.5.0

RUN wget -O - https://codeload.github.com/shaarli/Shaarli/tar.gz/v${VERSION} | tar zx --strip-components=1

RUN chown -R www-data:www-data /var/www/html

VOLUME /var/www/html/data

EXPOSE 80

#COPY ./ /var/www/html/

