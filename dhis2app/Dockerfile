FROM tomcat:8.0-alpine
EXPOSE 8080

RUN mkdir -p /dhis2/home
ENV DHIS2_HOME /dhis2/home
COPY scripts/wait-for-it.sh *.war /dhis2/

RUN apt-get update \ 
    && apt-get install -y curl netcat \
    && rm -rf /var/lib/apt/lists/*

RUN if [ ! -f /dhis2/dhis.war ]; \
    then \
        curl -L http://stable.dhis2.org -o /dhis2/dhis.war; \
    fi; \
    rm -rf /usr/local/tomcat/webapps/* \
    && unzip /dhis2/dhis.war -d /usr/local/tomcat/webapps/ROOT
