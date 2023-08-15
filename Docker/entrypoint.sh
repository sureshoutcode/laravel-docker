#!/bin/bash

# Check if the compose file  is already install
if [ ! -f "vendor/autoload.php"]; then
    compose install --no-progress --no-interaction

fi

if [! -f ".env"]; then
    echo "Creating ENV file for env $APP_ENV"
    cp .env.example .env

else
    echo "env file exists. "
fi
php artisan migrate
php artisan key:generate

php artisan serve --port=$PORT --host=0.0.0.0 --env=.env

exec docker-php-entrypojnt "$@"
