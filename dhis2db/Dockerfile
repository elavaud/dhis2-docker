FROM postgres:10.1-alpine

RUN rm -rf /var/cache/apk/* \
    && rm -rf /tmp/* \
    && apk update \
    && apk --no-cache add postgresql-10-postgis-2.4
