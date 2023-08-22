FROM	debian:buster

RUN		apt-get update -y && \
		apt-get upgrade -y && \
		apt-get -y install \
		mariadb-client \
		wget \
		curl \
		tar \
		php7.3-fpm \
		php-cli \
		php-mysql \
		vim \
		sudo


COPY	./tools/wordpress_setup.sh /tmp/wordpress_setup.sh
COPY	./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY	./tools/wp-config.php /tmp/wp-config.php

WORKDIR	/var/www/html/wordpress
RUN		mkdir -p /run/php

EXPOSE	9000

ENTRYPOINT ["sh", "/tmp/wordpress_setup.sh"]