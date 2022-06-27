FROM nginxproxy/nginx-proxy

RUN apt-get update
RUN apt-get install -y openssh-server supervisor

RUN mkdir /var/run/sshd
RUN echo 'root:root' |chpasswd
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/AllowTcpForwarding no/AllowTcpForwarding yes/g' /etc/ssh/sshd_config
RUN ssh-keygen -f /root/.ssh/id_rsa
RUN ssh-keygen -A

COPY supervisor.conf /etc/supervisor.conf
COPY hosts.tmpl /app/hosts.tmpl

CMD supervisord -c /etc/supervisor.conf -d /app
