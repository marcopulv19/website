FROM nginx:1.27-alpine

# Remove default nginx page
RUN rm -rf /usr/share/nginx/html/*

# Copy custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY index.html status.html 404.html style.css status.js portrait.jpg icon.svg /usr/share/nginx/html/
COPY resume/ /usr/share/nginx/html/resume/

# Expose HTTPS only
EXPOSE 443

# Healthcheck
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-check-certificate -qO- https://127.0.0.1/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
