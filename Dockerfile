FROM sdorra/oracle-java-8:8u92 

ENV SCM_VERSION 1.49 
ENV SCM_PKG_URL https://maven.scm-manager.org/nexus/content/repositories/releases/sonia/scm/scm-server/${SCM_VERSION}/scm-server-${SCM_VERSION}-app.tar.gz 
ENV SCM_HOME /var/lib/scm 

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \ 
  && apt-get update \ 
  && apt-get install -qq -y curl mercurial authbind nano \ 
  && curl -Lks "$SCM_PKG_URL" -o /root/scm-server.tar.gz \ 
  && /usr/sbin/useradd --create-home --home-dir /opt/scm-server --shell /bin/bash scm \
  && tar zxf /root/scm-server.tar.gz --strip=1 -C /opt/scm-server \
  && rm -f /root/scm-server.tar.gz \
  && chown -R scm:scm /opt/scm-server \
  && mkdir -p /var/lib/scm \ 
  && chown scm:scm /var/lib/scm \ 
  && apt-get autoremove \ 
  && apt-get clean \ 
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

RUN touch /etc/authbind/byport/80  && chmod +x /etc/authbind/byport/80 \
 && touch /etc/authbind/byport/443 && chmod +x /etc/authbind/byport/443

COPY entry.sh /
COPY server-config.xml /opt/scm-server/conf/server-config.xml

WORKDIR /var/lib/scm 
VOLUME /var/lib/scm 
EXPOSE 80 443
USER scm 

CMD ["/entry.sh"]
