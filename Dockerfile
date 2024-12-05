FROM nginx:latest
RUN apt-get update && apt-get install -y nano




# Add your custom configuration files or scripts here (optional)
# For example, to copy a custom nginx.conf:
# COPY nginx.conf /etc/nginx/conf.d/default.conf