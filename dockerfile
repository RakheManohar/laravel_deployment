FROM ubuntu
ENV DEBIAN_FRONTEND="noninteractive"
COPY . usr/src/myapp
WORKDIR usr/src/myapp/notejam
RUN apt-get update 
RUN apt-get install php -yq 
RUN apt-get install curl -yq
RUN apt-get install openssl zip php-zip unzip git -yq
RUN curl -s https://getcomposer.org/installer | php && php composer.phar self-update
RUN php composer.phar install --ignore-platform-reqs && touch app/database/notejam.db 
RUN php artisan migrate 
RUN php artisan serve





