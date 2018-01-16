FROM tomcat:8.0.48-jre8-alpine
EXPOSE 8080

RUN rm -rf /var/cache/apk/* \
    && rm -rf /tmp/* \
    && apk update \ 
    && apk --no-cache add curl netcat-openbsd

COPY wait-for dhis.war dhis.conf setconf.sh /
RUN mkdir -p /dhis2/home \
    && if [ -f "/dhis.war" ]; then \
      mv /dhis.war /dhis2/dhis.war; \
    fi; \
    chmod u+x /wait-for /setconf.sh

ENV DHIS2_HOME /dhis2/home

RUN if [ ! -f /dhis2/dhis.war ]; \
    then \
        curl -L http://stable.dhis2.org -o /dhis2/dhis.war; \
    fi; \
    rm -rf /usr/local/tomcat/webapps/* \
    && mkdir -p /usr/local/tomcat/webapps/ROOT \
    && unzip /dhis2/dhis.war -d /usr/local/tomcat/webapps/ROOT \
    && rm -rf /dhis2/home/dhis.conf \
    && mv /dhis.conf /dhis2/home/dhis.conf 
