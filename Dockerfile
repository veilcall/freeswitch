FROM alpine:3.19

RUN apk add --no-cache \
    freeswitch \
    freeswitch-mod-sofia \
    freeswitch-mod-verto \
    freeswitch-mod-commands \
    freeswitch-mod-dptools \
    freeswitch-mod-dialplan-xml \
    freeswitch-mod-loopback \
    freeswitch-mod-native-file \
    freeswitch-mod-sndfile \
    freeswitch-mod-tone-stream \
    freeswitch-mod-event-socket \
    freeswitch-mod-opus \
    freeswitch-mod-g711 \
    freeswitch-mod-g722

COPY conf/ /etc/freeswitch/

EXPOSE 8081
ENTRYPOINT ["freeswitch", "-nf", "-nonat"]
