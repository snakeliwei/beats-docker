FROM alpine:3.6
MAINTAINER Lyndon.li <snakeliwei@gmail.com>

RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk --update add --no-cache filebeat@testing

CMD [ "filebeat", "-e", "-c", "/etc/filebeat/filebeat.yml" ]
