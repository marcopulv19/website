# marcopulv

Minimal static profile site: plain HTML, CSS, and JavaScript served by Nginx in Docker over HTTPS.

## Files

- `public/pages/` — the home, resume, status, and 404 HTML pages.
- `public/embeds/` — the shared stylesheet, site icon, and portrait.
- `public/assets/` — supporting documents linked from the resume.
- `public/pages/resume.html` — resume page, available at `/resume.html`.
- `status.sh` — sets or checks online/maintenance state.
- `deploy/nginx.conf`, `deploy/dockerfile`, `deploy/docker-compose.yml` — HTTPS server and deployment configuration.
- `deploy/fullchain.pem`, `deploy/privkey.pem` — domain TLS certificate and private key.

## Run

Provide a domain-matching TLS certificate and private key as
`deploy/fullchain.pem` and `deploy/privkey.pem`, then start the site:

```sh
./status.sh online
docker compose -f deploy/docker-compose.yml up -d --build
```

The first command clears any maintenance flag so the site starts online. The
server listens on port 443 only. Certificate issuance and renewal are managed
outside the container.

## Site status

```sh
./status.sh maintenance
./status.sh status
./status.sh online
```

Maintenance mode redirects site requests to `status.html` without stopping Nginx.
The host creates or removes the root-level `site-maintenance` flag, which Nginx reads
through a read-only project-root mount. Unknown page paths return the branded 404.