#!/bin/bash
EXTRA_JVM_ARGUMENTS="-Djava.awt.headless=true -Dlogback.configurationFile=logging.xml"
REPO=/opt/scm-server/lib
CLASSPATH=:/opt/scm-server/conf:"$REPO"/scm-server-1.49.jar:"$REPO"/commons-daemon-1.0.15.jar:"$REPO"/jetty-server-7.6.19.v20160209.jar:"$REPO"/javax.servlet-2.5.0.v201103041518.jar:"$REPO"/jetty-continuation-7.6.19.v20160209.jar:"$REPO"/jetty-http-7.6.19.v20160209.jar:"$REPO"/jetty-io-7.6.19.v20160209.jar:"$REPO"/jetty-webapp-7.6.19.v20160209.jar:"$REPO"/jetty-xml-7.6.19.v20160209.jar:"$REPO"/jetty-servlet-7.6.19.v20160209.jar:"$REPO"/jetty-security-7.6.19.v20160209.jar:"$REPO"/jetty-jmx-7.6.19.v20160209.jar:"$REPO"/jetty-util-7.6.19.v20160209.jar:"$REPO"/jetty-ajp-7.6.19.v20160209.jar

authbind \
/usr/lib/jvm/java-8-oracle/bin/java \
 $EXTRA_JVM_ARGUMENTS \
 -classpath "$CLASSPATH" \
 -Dapp.name=scm-server \
 -Dapp.pid="$$" \
 -Dapp.repo="$REPO" \
 -Dbasedir=/opt/scm-server \
 sonia.scm.server.ScmServerDaemon
