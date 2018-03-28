FROM nginx:1.13.8-alpine

# Fix user (nginx spawns to this user set in config)
RUN adduser -h /var/www -D -u 1000 www-data

ENV PHP_UPSTREAM=php-fpm:9000
ENV SERVER_NAME=localhost
ENV SERVER_ALIAS=''
ENV SERVER_PORT=80
ENV SERVER_ROOT=/var/www

# Set config template up
COPY nginx.conf.template /etc/nginx/nginx.conf.template

ENTRYPOINT ["envsubst '$PHP_UPSTREAM $SERVER_NAME $SERVER_PORT $SERVER_ALIAS' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && nginx"]
