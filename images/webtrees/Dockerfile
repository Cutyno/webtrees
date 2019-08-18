# See https://github.com/lomadi/app-webtrees/tree/master/images/webtrees

FROM php:apache
MAINTAINER cutyno <webmaster@f-quadrat.com>

RUN apt-get update && apt-get install -y --fix-missing apt-utils gnupg --no-install-recommends \
	&& echo "deb http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list \
	&& echo "deb-src http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list \
	&& echo "deb http://security.ubuntu.com/ubuntu xenial-security main" >> /etc/apt/sources.list \
	&& curl -sS --insecure https://www.dotdeb.org/dotdeb.gpg | apt-key add - \
	&& apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 40976EAF437D05B5 3B4FE6ACC0B21F32 \
	&& apt-get purge -y gnupg

RUN apt-get update && apt-get install -y \
		libfreetype6 \
		libjpeg62-turbo \
		libmcrypt4 \
		libpng12-0 \
		sendmail --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

RUN buildDeps=" \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libjpeg-dev \
		libldap2-dev \
		libmcrypt-dev \
		libpng12-dev \
		zlib1g-dev \
		libzip-dev \
	"; \
	set -x \
	&& apt-get update && apt-get install -y $buildDeps --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install mysqli \
	&& docker-php-ext-install pdo_mysql \
	&& docker-php-ext-install zip

RUN docker-php-ext-install gd \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

WORKDIR /var/www/html/

RUN apt-get update && apt-get install -y wget unzip --no-install-recommends \
	&& wget https://github.com/fisharebest/webtrees/releases/download/1.7.14/webtrees-1.7.14.zip \
	&& unzip webtrees-*.zip \
	&& chown -R www-data:www-data  /var/www/html \
	&& rm webtrees-*.zip \
	&& apt-get purge -y wget unzip

ADD scripts /opt/scripts
WORKDIR /opt/scripts
RUN chmod a+x *.sh

ADD  config/php.ini /usr/local/etc/php

ENTRYPOINT ["/opt/scripts/entrypoint.sh"]
