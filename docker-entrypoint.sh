#!/bin/sh
set -e

if [ "$1" = 'symfony' ] || [ "$1" = 'php' ] || [ "$1" = 'bin/console' ]; then
  composer install --prefer-dist --no-progress --no-interaction
fi

exec docker-php-entrypoint "$@"
