FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    gnupg2 curl ca-certificates lsb-release wget \
    && rm -rf /var/lib/apt/lists/*

# Install FreeSWITCH from official repo
RUN curl -fsSL https://files.freeswitch.org/repo/deb/debian-release/fsstretch-archive-keyring.asc \
    | gpg --dearmor -o /usr/share/keyrings/freeswitch.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/freeswitch.gpg] https://files.freeswitch.org/repo/deb/debian-release/ bookworm main" \
    > /etc/apt/sources.list.d/freeswitch.list && \
    apt-get update && apt-get install -y --no-install-recommends \
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
    && rm -rf /var/lib/apt/lists/*

# Copy configuration
COPY conf/ /etc/freeswitch/

EXPOSE 8081
ENTRYPOINT ["freeswitch", "-nf", "-nonat"]
