FROM debian:stable-slim

MAINTAINER DerBunman

ARG APACHE_RUN_USER=1000
ENV APACHE_RUN_USER=$APACHE_RUN_USER
ARG APACHE_RUN_GROUP=1000
ENV APACHE_RUN_GROUP=$APACHE_RUN_GROUP

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update \
	&& apt-get -y install apache2

RUN adduser --uid 1000 --gecos 'My Apache User' --disabled-password myuser \
	&& mkdir -p /var/www/ /var/lock/apache2 /var/run/apache2 \
	&& chown -R "$APACHE_RUN_USER:$APACHE_RUN_GROUP" /var/www/ /var/lock/apache2 /var/run/apache2

EXPOSE 80
COPY entrypoint.sh /
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
