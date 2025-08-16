# Use the official Privado ID issuer node image
FROM privadoid/issuernode-api:latest

# Install Redis
RUN apk update && apk add --no-cache redis

# Copy configuration files
COPY resolvers_settings.yaml /app/resolvers_settings.yaml

# Set working directory
WORKDIR /app

# Create empty payment settings file
RUN echo "# Payment settings placeholder" > /app/payment_settings.yaml

# Create startup script
RUN echo '#!/bin/sh\nredis-server --daemonize yes\nexport ISSUER_SERVER_PORT=${PORT:-8001}\n/usr/local/bin/issuer-node' > /app/start.sh && chmod +x /app/start.sh

# Expose the port
EXPOSE 8001

# Start Redis and the application
CMD ["/app/start.sh"]