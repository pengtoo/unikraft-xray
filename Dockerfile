FROM alpine:3.20

# Xray-core (pinned to the version verified locally: 25.10.15)
RUN set -xe; \
    apk add --no-cache curl unzip ca-certificates; \
    curl -fsSL -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/download/v25.10.15/Xray-linux-64.zip; \
    mkdir -p /usr/local/bin /etc/xray; \
    unzip -o /tmp/xray.zip xray -d /usr/local/bin/; \
    chmod +x /usr/local/bin/xray; \
    rm /tmp/xray.zip; \
    apk del curl unzip

COPY config.template.json /etc/xray/config.template.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/bin/sh", "/entrypoint.sh"]
