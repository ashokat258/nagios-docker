FROM ubuntu
MAINTAINER ashok
ENV http_proxy=http://ashoka_t:Bhargu%40098@blrproxy.persistent.co.in:8080
ENV https_proxy=http://ashoka_t:Bhargu%40098@blrproxy.persistent.co.in:8080
ENV passwd  bingo

RUN apt-get update && apt-get install -y  nagios3 nagios-nrpe-plugin supervisor

RUN  htpasswd -cb /etc/nagios3/htpasswd.users  nagiosadmin $passwd


COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80

CMD ["/usr/bin/supervisord"]
