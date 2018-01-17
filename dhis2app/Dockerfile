FROM tomcat:8.0.48-jre8-alpine
EXPOSE 8080

RUN rm -rf /var/cache/apk/* \
    && rm -rf /tmp/* \
    && apk update \ 
    && apk --no-cache add curl netcat-openbsd

ADD . /
RUN rm -rf /usr/local/tomcat/webapps/ROOT \
    && mkdir -p /opt/dhis2/config \
    && mv /hibernate.properties /opt/dhis2/config/hibernate.properties \
    && mv /dhis.conf /opt/dhis2/config/dhis.conf \
    && if [ -f "/dhis.war" ]; then \
      mv /dhis.war /usr/local/tomcat/webapps/ROOT.war; \
    else \
      curl -L http://stable.dhis2.org -o /usr/local/tomcat/webapps/ROOT.war; \
    fi; \
    chmod u+x /wait-for /setconf.sh \
    && echo "export JAVA_OPTS=$JAVA_OPTS \n export DHIS2_HOME='/opt/dhis2/config'" >> /usr/local/tomcat/bin/setenv.sh

