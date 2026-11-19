#!/bin/sh
# The node UUID is injected at instance creation via the UUID env var.
# It is never baked into the image or the source repo.
set -e
if [ -z "$UUID" ]; then
  echo "UUID env var is required" >&2
  exit 1
fi
sed "s/__UUID__/$UUID/g" /etc/xray/config.template.json > /etc/xray/config.json
exec /usr/local/bin/xray run -c /etc/xray/config.json
