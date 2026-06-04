FROM hshar/webapp

# Copy application code to web directory
COPY . /var/www/html

# Set working directory
WORKDIR /var/www/html

EXPOSE 80
