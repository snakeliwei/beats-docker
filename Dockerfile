FROM alpine:3.6
MAINTAINER Lyndon.li <snakeliwei@gmail.com>

RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk --no-cache add filebeat@testing 

RUN mkdir -p /config-dir \
    && mkdir -p /var/lib/filebeat \
    && chown -R filebeat:filebeat /var/lib/filebeat

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

CMD filebeat -c /etc/filebeat/filebeat.yml -e
