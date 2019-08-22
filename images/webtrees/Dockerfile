#setting php version
ARG PHP_VERSION=7.3.8

#getting base image
FROM php:$PHP_VERSION-apache

#recover php version
ARG PHP_VERSION=7.3.8
LABEL version.php=$PHP_VERSION

#setting webtrees version
ARG WEBTREES_VERSION=1.7.14
#setting lable
LABEL creator="lomadi@mac.com"
LABEL maintainer="webmaster@f-quadrat.com"
LABEL version.webtrees=$WEBTREES_VERSION

#fix installations and add source 
RUN apt-get update && apt-get -y --fix-missing --fix-broken install \
	&& apt-get -y --no-install-recommends install apt-utils gnupg \
	&& echo "deb http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list \
	&& echo "deb-src http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list \
	&& echo "deb http://security.ubuntu.com/ubuntu xenial-security main" >> /etc/apt/sources.list \
	&& curl -sS --insecure https://www.dotdeb.org/dotdeb.gpg | apt-key add - \
	&& apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 40976EAF437D05B5 3B4FE6ACC0B21F32 \
	&& apt-get -y purge gnupg

#install needed packages
RUN apt-get update && apt-get -y --no-install-recommends install \
		libfreetype6 \
		libjpeg62-turbo \
		libmcrypt4 \
		libpng12-0 \
		sendmail \
	&& rm -rf /var/lib/apt/lists/*

#install build dependencies
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
	&& apt-get update && apt-get -y --no-install-recommends install $buildDeps && rm -rf /var/lib/apt/lists/*

#install php add-ons
RUN docker-php-ext-install mysqli \
	&& docker-php-ext-install pdo_mysql \
	&& docker-php-ext-install zip \
	&& docker-php-ext-install gd \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& apt-get -y --auto-remove purge $buildDeps

WORKDIR /var/www/html/

#install webtrees
RUN echo $WEBTREES_VERSION
RUN apt-get update && apt-get -y --no-install-recommends install wget unzip \
	&& wget https://github.com/fisharebest/webtrees/releases/download/$WEBTREES_VERSION/webtrees-$WEBTREES_VERSION.zip \
	&& unzip webtrees-*.zip \
	&& chown -R www-data:www-data  /var/www/html \
	&& rm webtrees-*.zip \
	&& apt-get -y purge wget unzip \
	&& apt-get -y autoremove \
	&& apt-get -y autoclean

ADD scripts /opt/scripts
WORKDIR /opt/scripts
RUN chmod a+x *.sh

ADD  config/php.ini /usr/local/etc/php

ENTRYPOINT ["/opt/scripts/entrypoint.sh"]

EXPOSE 80/tcp
EXPOSE 443/tcp

HEALTHCHECK CMD service apache2 status || exit 1
