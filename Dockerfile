FROM php:7-alpine

RUN apk --update add \
    php7-mcrypt \
    php7-zip \
    wget \
    curl \
    git

RUN echo "memory_limit=1024M" > /usr/local/etc/php/conf.d/memory-limit.ini && \
    echo "date.timezone=${PHP_TIMEZONE:-UTC}" > /usr/local/etc/php/conf.d/date_timezone.ini

RUN wget http://rocketeer.autopergamene.eu/versions/rocketeer.phar && \
    chmod +x rocketeer.phar && \
    mv rocketeer.phar /usr/local/bin/rocketeer

# Set up the application directory
VOLUME ["/app"]
WORKDIR /app

# Set up the command arguments
ENTRYPOINT ["rocketeer"]
