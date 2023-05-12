#syntax=docker/dockerfile:1.4

FROM composer/composer:2-bin AS composer

# PHP 7.4
FROM php:7.4-alpine AS php_74

WORKDIR /srv/app

RUN apk add --no-cache \
    bash \
    libgcc \
    git \
;

RUN set -eux; \
	curl -sS https://get.symfony.com/cli/installer | bash \
    && mv /root/.symfony5/bin/symfony /usr/local/bin/symfony \
    ;

ENV COMPOSER_ALLOW_SUPERUSER=1
ENV PATH="${PATH}:/root/.composer/vendor/bin"

COPY --from=composer --link /composer /usr/bin/composer

RUN set -eux; \
    curl -o /tmp/datadog-setup.php -L "https://github.com/DataDog/dd-trace-php/releases/latest/download/datadog-setup.php" \
    && php /tmp/datadog-setup.php --php-bin=all --enable-appsec --enable-profiling \
    && rm -rf /tmp/datadog-setup.php \
;

COPY --link docker-entrypoint.sh /usr/local/bin/docker-entrypoint
RUN chmod +x /usr/local/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]

CMD ["symfony", "server:start"]


# PHP 7.4
FROM php:8.2-alpine as php_82

WORKDIR /srv/app

RUN apk add --no-cache \
    bash \
    libgcc \
    git \
;

RUN set -eux; \
	curl -sS https://get.symfony.com/cli/installer | bash \
    && mv /root/.symfony5/bin/symfony /usr/local/bin/symfony \
    ;

ENV COMPOSER_ALLOW_SUPERUSER=1
ENV PATH="${PATH}:/root/.composer/vendor/bin"

COPY --from=composer --link /composer /usr/bin/composer

RUN set -eux; \
    curl -o /tmp/datadog-setup.php -L "https://github.com/DataDog/dd-trace-php/releases/latest/download/datadog-setup.php" \
    && php /tmp/datadog-setup.php --php-bin=all --enable-appsec --enable-profiling \
    && rm -rf /tmp/datadog-setup.php \
;

COPY --link docker-entrypoint.sh /usr/local/bin/docker-entrypoint
RUN chmod +x /usr/local/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]

CMD ["symfony", "server:start"]
