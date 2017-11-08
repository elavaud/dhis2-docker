FROM tomcat:8
EXPOSE 8080

RUN mkdir -p /dhis2/home
ENV DHIS2_HOME /dhis2/home
COPY scripts/wait-for-it.sh dhis.conf *.war /dhis2/

RUN apt-get update \ 
    && apt-get install -y curl netcat \
    && rm -rf /var/lib/apt/lists/*

RUN if [ -f /dhis2/dhis.conf ]; \
    then \
        cp /dhis2/dhis.conf /dhis2/home/; \
    fi

RUN if [ ! -f /dhis2/dhis.war ]; \
    then \
        curl -L http://stable.dhis2.org -o /dhis2/dhis.war; \
    fi; \
    rm -rf /usr/local/tomcat/webapps/* \
    && cp /dhis2/dhis.war /usr/local/tomcat/webapps/ROOT.war
