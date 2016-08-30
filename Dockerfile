FROM minimum2scp/systemd:latest
ARG DEBIAN_FRONTEND=noninteractive
MAINTAINER John Headley "keoni84@gmail.com"

RUN apt-get update -qq && apt-get install -yqq \
rsync \
curl \
&& /usr/bin/timedatectl set-timezone Etc/UTC \
&& /bin/echo 'alias ll="ls -l --color=auto"' >> /etc/bash.bashrc \
&& apt-get autoremove --purge -y \
&& apt-get clean

EXPOSE 22

CMD ["/sbin/init"]
