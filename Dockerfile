FROM nginx
MAINTAINER Roman Rott <roman@rrott.com>

RUN apt-get update; apt-get install -y \
    openssl

RUN mkdir -p /var/www/rrott.com/ && \
    mkdir -p /var/www/rrott.com/public

# nginx site conf
ADD config/nginx/rrott.com.conf /etc/nginx/sites-available/rrott.com.conf
ADD config/nginx/nginx.conf /etc/nginx/nginx.conf

RUN ln -s /etc/nginx/sites-available/rrott.com.conf /etc/nginx/sites-enabled/rrott.com.conf

# Add SSL
ADD /home/roman/rrott.com/ssl /etc/ssl/rrott.com

ADD /home/roman/rrott.com/errors /var/www/errors/
ADD /home/roman/rrott.com/logs /var/log/nginx/
ADD /home/roman/rrott.com/current/public /var/www/rrott.com/public
# EXPOSE 80
CMD ["nginx"]
