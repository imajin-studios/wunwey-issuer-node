# Use the official Privado ID issuer node image
FROM privadoid/issuernode-api:latest

# Install Redis
RUN apt-get update && apt-get install -y redis-server && rm -rf /var/lib/apt/lists/*

# Copy configuration files
COPY resolvers_settings.yaml /app/resolvers_settings.yaml

# Set working directory
WORKDIR /app

# Create empty payment settings file
RUN echo "# Payment settings placeholder" > /app/payment_settings.yaml

# Create startup script
RUN echo '#!/bin/bash\nredis-server --daemonize yes\n./bin/platform_linux' > /app/start.sh && chmod +x /app/start.sh

# Expose the port
EXPOSE 10000

# Start Redis and the application
CMD ["/app/start.sh"]