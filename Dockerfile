FROM alpine:3.19

RUN apk add --no-cache freeswitch

COPY conf/ /etc/freeswitch/

EXPOSE 8081
ENTRYPOINT ["freeswitch", "-nf", "-nonat"]
