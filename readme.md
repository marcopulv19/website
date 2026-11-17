# marcopulv

Minimal static profile site: plain HTML, CSS, and JavaScript served by Nginx in Docker over HTTPS.

## Files

- `index.html` — homepage and social cards.
- `status.html` — live online/maintenance status page.
- `404.html` — branded not-found page.
- `style.css` — shared page styling and responsive social grid.
- `status.js` — updates the live site status.
- `resume/` — resume page and its assets, available at `/resume`.
- `status.sh` — sets or checks online/maintenance state.
- `nginx.conf`, `dockerfile`, `docker-compose.yml` — HTTPS server and deployment.

## Run

Provide a domain-matching TLS certificate and private key as
`certs/fullchain.pem` and `certs/privkey.pem`, then start the site:

```sh
./status.sh online
docker compose up -d --build
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