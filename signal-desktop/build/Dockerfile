FROM debian:stable-slim

ARG USER
ENV USER=$USER
ARG UID
ENV UID=$UID
ARG GID
ENV GID=$GID
ARG HOSTNAME
ENV HOSTNAME=$HOSTNAME

RUN true && \
	echo $HOSTNAME > /etc/hostname && \
	useradd --uid=$UID --gid=$GID -d /home/$USER $USER && \
	mkdir -p /home/$USER && \
	chown $USER -R /home/$USER

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && apt-get -y install curl gnupg
RUN curl -s https://updates.signal.org/desktop/apt/keys.asc | apt-key add -
RUN echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | tee -a /etc/apt/sources.list.d/signal-xenial.list

RUN apt-get -y update && apt-get -y install signal-desktop libx11-xcb1
RUN apt-get remove --yes --autoremove --purge curl gnupg gpg pinentry-curses
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man/?? /usr/share/man/??_*

RUN true && \
	mkdir -p /home/$USER && \
	chown $USER -R /home/$USER


ENV HOME /home/$USER

CMD chown $USER -R /home/$USER

USER $USER
CMD /usr/bin/signal-desktop --no-sandbox
