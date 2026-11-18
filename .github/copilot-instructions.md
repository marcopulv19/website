# Copilot workspace instructions

- This repository is a static Nginx website deployed with Docker Compose.
- When the user says "DEPLOY", run immediately: `./status.sh online && docker compose -f deploy/docker-compose.yml up -d --build`.
- When the user says "RESTART", run immediately: `docker compose -f deploy/docker-compose.yml restart && ./status.sh status && docker compose -f deploy/docker-compose.yml ps`.
- After deployment, verify it by running `./status.sh status && docker compose -f deploy/docker-compose.yml ps && curl --insecure --fail --silent --show-error --head https://127.0.0.1/resume/ | head`.
- Do not ask for confirmation for standard deployment commands.
