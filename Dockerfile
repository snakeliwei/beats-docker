FROM alpine:3.6
MAINTAINER Lyndon.li <snakeliwei@gmail.com>

RUN addgroup -S filebeat && adduser -S -G filebeat filebeat \
    && echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk --no-cache add filebeat@testing 'su-exec>=0.2' \
    && mkdir -p /config-dir

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD [ "filebeat" ]
