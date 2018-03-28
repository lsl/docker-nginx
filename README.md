# [Alpine Linux + nginx](https://github.com/lsl/docker-nginx)

A basic alpine based image with nginx.

```
FROM lslio/nginx

# This should match your php-fpm upstream
ENV PHP_UPSTREAM=php-fpm:9000
ENV SERVER_NAME=localhost
ENV SERVER_PORT=80
ENV SERVER_ALIAS="example.localhost api.example.localhost"
ENV SERVER_ROOT=/var/www

COPY --chown=www-data:www-data . /var/www
```