FROM nginx
MAINTAINER Roman Rott <roman@rrott.com>

RUN apt-get update; apt-get install -y \
    openssl

RUN mkdir -p /var/www/rrott.com/ && \
    mkdir -p /var/www/rrott.com/public

COPY current/config/nginx/rrott.com.conf /etc/nginx/sites-available/rrott.com.conf
COPY current/config/nginx/rrott.com.conf /etc/nginx/sites-enabled/rrott.com.conf
COPY current/config/nginx/nginx.conf /etc/nginx/nginx.conf

COPY ssl /etc/ssl/rrott.com
COPY errors /var/www/errors/
COPY logs /var/log/nginx/
COPY current/public /var/www/rrott.com/public
# EXPOSE 80
CMD ["nginx"]
