# Copilot workspace instructions

- This repository is a static Nginx website deployed with Docker Compose.
- When the user says "DEPLOY", run immediately: `./scripts/status.sh online && docker compose up -d --build`.
- When the user says "RESTART", run immediately: `docker compose restart && ./scripts/status.sh status && docker compose ps`.
- After deployment, verify it by running `./scripts/status.sh status && docker compose ps && curl --insecure --fail --silent --show-error --head https://127.0.0.1/resume/ | head`.
- Do not ask for confirmation for standard deployment commands.
