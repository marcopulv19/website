# --- Stage 1: Lightweight Nginx server for static portfolio ---
FROM nginx:1.27-alpine

# Remove default nginx page
RUN rm -rf /usr/share/nginx/html/*

# Copy custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy portfolio files
COPY index.html /usr/share/nginx/html/
COPY style.css  /usr/share/nginx/html/

# Expose HTTPS only
EXPOSE 443

# Healthcheck
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-check-certificate -qO- https://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
