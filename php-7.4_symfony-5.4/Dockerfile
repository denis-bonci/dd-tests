#syntax=docker/dockerfile:1.4

# Builder images
FROM composer/composer:2-bin AS composer

# Prod image
FROM php:7.4-alpine

WORKDIR /srv/app

# persistent / runtime deps
RUN apk add --no-cache \
    bash \
#		acl \
#		fcgi \
#		file \
#		gettext \
		git \
	;

#RUN set -eux; \
#    install-php-extensions \
#		apcu \
#		intl \
#		opcache \
#		zip \
#    ;

RUN set -eux; \
	curl -sS https://get.symfony.com/cli/installer | bash \
    && mv /root/.symfony5/bin/symfony /usr/local/bin/symfony \
    ;

# https://getcomposer.org/doc/03-cli.md#composer-allow-superuser
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV PATH="${PATH}:/root/.composer/vendor/bin"

COPY --from=composer --link /composer /usr/bin/composer

CMD ["symfony", "server:start"]

# https://getcomposer.org/doc/03-cli.md#composer-allow-superuser
#ENV COMPOSER_ALLOW_SUPERUSER=1
#ENV PATH="${PATH}:/root/.composer/vendor/bin"
#
#COPY --from=composer --link /composer /usr/bin/composer

# Dev image
#FROM app_php AS app_php_dev
#
#ENV APP_ENV=dev XDEBUG_MODE=off
#VOLUME /srv/app/var/
#
#RUN rm "$PHP_INI_DIR/conf.d/app.prod.ini"; \
#	mv "$PHP_INI_DIR/php.ini" "$PHP_INI_DIR/php.ini-production"; \
#	mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"
#
#COPY --link docker/php/conf.d/app.dev.ini $PHP_INI_DIR/conf.d/
#
#RUN set -eux; \
#	install-php-extensions \
#    	xdebug \
#    ;
#
#RUN rm -f .env.local.php

