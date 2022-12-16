#!/usr/bin/env bash

# update package manager
sudo apt-get update
sudo apt-get upgrade


# install Git
sudo apt-get install -y git
# git clone into repository

git clone https://github.com/burnermkali/public-406solutions-website.git
# install Docker
sudo apt-get install -y docker.io

# start and enable Docker service
sudo systemctl start docker

sudo systemctl enable docker

 
# install Nginx
sudo apt-get install -y nginx

# start and enable Nginx service
sudo systemctl start nginx

sudo systemctl enable nginx

# install Docker Compose

sudo apt-get install -y docker-compose


# Install the required system packages.
apt-get update

apt-get install -y nginx gunicorn supervisor

echo "from here the installations are over and the configuration begins"

# Copy the Flask application to the target directory.
cp -r /path/to/flask/app /var/www/flask-app

# Create a new NGINX configuration file for the Flask application.
cat > /etc/nginx/sites-enabled/flask-app.conf << EOF
server {
    listen 80;
    server_name example.com;

    location / {
        include proxy_params;
        proxy_pass http://unix:/var/www/flask-app/app.sock;
    }
}
EOF

# Configure the Flask application's production environment variables.
cat > /var/www/flask-app/.env << EOF
SECRET_KEY=<your_secret_key>
FLASK_ENV=production
EOF

# Create a new Gunicorn configuration file for the Flask application.
cat > /var/www/flask-app/gunicorn.conf.py << EOF
bind = 'unix:/var/www/flask-app/app.sock'
workers = 3
EOF

# Create a new Supervisor configuration file for the Flask application.
cat > /etc/supervisor/conf.d/flask-app.conf << EOF
[program:flask-app]
command = gunicorn -c /var/www/flask-app/gunicorn.conf.py app:app
directory = /var/www/flask-app
user = www-data
autostart = true
autorestart = true
EOF

# Restart NGINX and Supervisor to apply the changes.
service nginx restart

service supervisor restart
