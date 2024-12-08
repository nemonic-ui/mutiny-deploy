FROM debian:latest

# Install systemd
RUN apt-get update && apt-get install -y systemd

# Ensure necessary directories exist
RUN mkdir -p /etc/systemd/system/

# Copy service file into the correct location (example with SSH)
COPY ssh.service /etc/systemd/system/

# Enable and start the service
RUN systemctl enable ssh.service

ENTRYPOINT ["/usr/sbin/init"]




# Add your custom configuration files or scripts here (optional)
# For example, to copy a custom nginx.conf:
# COPY nginx.conf /etc/nginx/conf.d/default.conf