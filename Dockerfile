FROM debian:latest

MAINTAINER John Headley "keoni84@gmail.com"

RUN apt-get update && \
apt-get install -y openssh-server rsync curl && \
/usr/bin/timedatectl set-timezone Etc/UTC && \
rm -rf /var/lib/apt/lists/* && \
apt-get clean

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
	sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN mkdir -p /var/run/sshd
	
EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]
