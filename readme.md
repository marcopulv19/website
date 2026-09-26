# Build and run the website
docker compose up -d

## Run with HTTPS

Point your domain at this server and provide a TLS certificate and private key
as `certs/fullchain.pem` and `certs/privkey.pem`. The certificate must cover
the domain used to access the site. Then start the HTTPS configuration:

```sh
mkdir -p certs
docker compose -f docker-compose.yml -f docker-compose.https.yml up -d --build
```

The HTTPS configuration listens on ports 80 and 443, redirects normal web
requests from HTTP to HTTPS, and keeps `/healthz` available for the container
health check. Certificate issuance and renewal are managed outside this
container.