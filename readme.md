# Build and run the website (HTTPS only)

Point your domain at this server and provide a TLS certificate and private key
as `certs/fullchain.pem` and `certs/privkey.pem`. The certificate must cover
the domain used to access the site. Then start the website:

```sh
mkdir -p certs
docker compose up -d --build
```

The server listens on port 443 only; port 80 is neither published nor served.
Certificate issuance and renewal are managed outside this container.