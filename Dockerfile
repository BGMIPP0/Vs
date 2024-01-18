# Use the latest Ubuntu image
FROM ubuntu:20.04

# Update and install required packages
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    sudo

# Install Visual Studio Code (code-server)
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Set the working directory
WORKDIR /app

# Expose port 1010
EXPOSE 1010

# Start code-server on port 1010 without authentication
CMD ["code-server", "--bind-addr=0.0.0.0:1010", "--auth=none", "--user-data-dir=/app/data"]
