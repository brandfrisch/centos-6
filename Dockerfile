FROM debian:8
MAINTAINER Martin Diederich <martin.diederich@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://security.debian.org/ jessie/updates main contrib non-free \n\
deb http://ftp.de.debian.org/debian jessie main contrib non-free \n\
deb http://ftp.de.debian.org/debian jessie-updates main contrib non-free \n\
deb http://ftp.de.debian.org/debian jessie-backports main" > /etc/apt/sources.list

RUN echo "APT::Get::Install-Recommends 'false'; \n\
APT::Get::Install-Suggests 'false';" > /etc/apt/apt.conf.d/00-general

RUN apt-get update
RUN apt-get install -y apt-utils

RUN apt-get install -y net-tools procps ssl-cert ca-certificates apt-transport-https python sudo nano curl

RUN curl -L https://github.com/aelsabbahy/goss/releases/download/v0.2.3/goss-linux-amd64 -o /usr/local/bin/goss
RUN chmod +rx /usr/local/bin/goss
