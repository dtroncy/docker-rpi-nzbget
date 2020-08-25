# dtroncy/rpi-nzbget
FROM dtroncy/rpi-alpine:3.12.0

ARG nzbget_version

# Install nzbget
RUN apk add --update wget \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /volumes/config /volumes/download /opt/nzbget /setup \
    && cd /setup \
    && wget --no-check-certificate https://github.com/nzbget/nzbget/releases/download/v$nzbget_version/nzbget-$nzbget_version-bin-linux.run \
    && sh nzbget-$nzbget_version-bin-linux.run --arch armel --destdir /opt/nzbget \
    && apk del wget \
    && cd  \
    && rm -r /setup \
    && touch /opt/init.sh \
    && echo 'if [ ! -f "/volumes/config/nzbget.conf" ]; then cp /opt/nzbget/nzbget.conf /volumes/config/nzbget.conf; fi' >> /opt/init.sh \
    && echo './opt/nzbget/nzbget -s -o OutputMode=log -c /volumes/config/nzbget.conf' >> /opt/init.sh

# Volume mappings
VOLUME /volumes/config /volumes/download

# Exposes nzbget's default port
EXPOSE 6789

# Start nzbget in server and log mode
ENTRYPOINT ["sh", "/opt/init.sh"]
