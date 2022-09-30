FROM nginx:alpine

# Copy nginx config file
COPY nginx.conf /etc/nginx/nginx.conf

# Copy angular material
COPY /dist/aston-villa-app /usr/share/nginx/html

# Expose 80 port
EXPOSE 80