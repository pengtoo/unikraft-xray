# unikraft-xray

Xray-core (VLESS + WebSocket) packaged as a Unikraft Cloud image.

- The platform terminates TLS on 443 and forwards to the app on 8080 (`/ws`).
- The node UUID is **not** in this repo or the image: it is injected at
  instance creation through the `UUID` environment variable, and
  `entrypoint.sh` renders the config from `config.template.json` at boot.
- Xray version is pinned in the `Dockerfile` (v25.10.15).

Build & run (Unikraft Cloud, Singapore metro):

```bash
unikraft build . --output <org>/xray:latest
unikraft run --metro sin --image <org>/xray:latest \
  -p 443:8080/http+tls -m 256M -e UUID=<uuid>
```

Maintainer: P3ter
