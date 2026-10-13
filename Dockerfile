# ================================================
# Dockerfile — DevOps Journey
# Uses nginx:alpine for a lightweight web server
# ================================================

# Stage 1: Use official Nginx Alpine image (very small, ~23MB)
FROM nginx:alpine

# Set metadata labels
LABEL maintainer="PraveenGIT31"
LABEL description="DevOps Journey – Sample website for learning GitHub, Docker, Kubernetes"
LABEL version="1.0.0"

# Remove default nginx HTML content
RUN rm -rf /usr/share/nginx/html/*

# Copy our website files into the nginx web root
COPY app/ /usr/share/nginx/html/

# Copy custom nginx config (optional - uses sensible defaults)
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 (nginx default)
EXPOSE 80

# Start Nginx in the foreground (required for Docker)
CMD ["nginx", "-g", "daemon off;"]
