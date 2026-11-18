# marcopulv

Minimal static profile site: plain HTML, CSS, and JavaScript served by Nginx in Docker over HTTPS.

## Files

- `public/` — website pages and assets served by Nginx.
- `public/resume/` — resume page, stylesheet, and supporting documents, available at `/resume`.
- `scripts/status.sh` — sets or checks online/maintenance state.
- `deploy/nginx.conf`, `dockerfile`, `docker-compose.yml` — HTTPS server and deployment.

## Run

Provide a domain-matching TLS certificate and private key as
`certs/fullchain.pem` and `certs/privkey.pem`, then start the site:

```sh
./scripts/status.sh online
docker compose up -d --build
```

The first command clears any maintenance flag so the site starts online. The
server listens on port 443 only. Certificate issuance and renewal are managed
outside the container.

## Site status

```sh
./scripts/status.sh maintenance
./scripts/status.sh status
./scripts/status.sh online
```

Maintenance mode redirects site requests to `status.html` without stopping Nginx.
The host creates or removes the root-level `site-maintenance` flag, which Nginx reads
through a read-only project-root mount. Unknown page paths return the branded 404.