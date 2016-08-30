FROM debian:latest
MAINTAINER John Headley <keoni84@gmail.com>

RUN export DEBIAN_FRONTEND=noninteractive \
&& echo "
deb http://mirror.steadfast.net/debian/ jessie main contrib non-free
deb-src http://mirror.steadfast.net/debian/ jessie main contrib non-free
deb http://security.debian.org/ jessie/updates main contrib non-free
deb-src http://security.debian.org/ jessie/updates main contrib non-free
deb http://mirror.steadfast.net/debian/ jessie-updates main contrib non-free
deb-src http://mirror.steadfast.net/debian/ jessie-updates main contrib non-free" > /etc/apt/sources.list \
&& apt-get update \
&& apt-get install --no-install-recommends -y systemd systemd-sysv dbus libpam-systemd openssh-server less rsync \
&& apt-get dist-upgrade -y --fix-missing --fix-broken \
&& apt-get autoremove --purge -y \
&& apt-get clean

EXPOSE 22

CMD ["/sbin/init"]
