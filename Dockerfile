FROM php:5.6-apache

RUN apt-get -y update && LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y \
	wget

WORKDIR /var/www/html

ENV VERSION 0.0.45

RUN wget -O - https://github.com/shaarli/Shaarli/archive/v${VERSION}beta.tar.gz | tar zx --strip-components=1

RUN chown -R www-data:www-data /var/www/html

VOLUME /var/www/html/data

EXPOSE 80

#COPY ./ /var/www/html/

