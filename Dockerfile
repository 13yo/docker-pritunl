# Pritunl
# 

FROM ubuntu:16:10

MAINTAINER Tobias Kaatz <tobias.kaatz@gmail.com> 

ADD pritunl.list /etc/apt/sources.list.d/pritunl.list

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
RUN apt-get update -q
RUN apt-get install -y pritunl mongodb-server

ADD entry.sh /bin/entry.sh

EXPOSE 9700
EXPOSE 1194
EXPOSE 11194

ENTRYPOINT ["/bin/entry.sh"]

CMD ["/usr/bin/tail", "-f","/var/log/pritunl.log"]




