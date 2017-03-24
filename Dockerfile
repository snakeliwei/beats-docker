FROM alpine:3.5
MAINTAINER Lyndon.li <snakeliwei@gmail.com>

RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk --update add filebeat

CMD [ "filebeat", "-e", "-c", "/etc/filebeat/filebeat.yml"]
