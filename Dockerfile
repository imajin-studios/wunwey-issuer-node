# Use the official Privado ID issuer node image
FROM privadoid/issuernode-api:latest

# Copy configuration files
COPY resolvers_settings.yaml /app/resolvers_settings.yaml

# Set working directory
WORKDIR /app

# Create empty payment settings file
RUN echo "# Payment settings placeholder" > /app/payment_settings.yaml

# Expose the port
EXPOSE 10000

# Start the application
CMD ["./bin/platform_linux"]
