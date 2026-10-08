FROM debian:trixie-slim

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y --no-install-recommends apache2 ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY meu_site.tar /tmp/meu_site.tar
RUN tar -xf /tmp/meu_site.tar -C /var/www/html \
    && rm /tmp/meu_site.tar \
    && chown -R www-data:www-data /var/www/html

EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]
