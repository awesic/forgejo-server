#!/bin/bash

sudo apt update && sudo apt install -y docker-compose nginx

sudo adduser --sytem --shell /bin/bash --gecos 'Git Version Control' --group --disabled-password --home /home/git git

sudo usermod -aG docker git

mkdir ~/forgejo

USER_UID=$(id -u git)
USER_GID=$(id -g git)
echo -e "USER_UID=$USER_UID\nUSER_GID=$USER_GID" > /home/git/.env.forgejo

sudo docker-compose up -d

sudo ufw allow OpenSSH && sudo ufw allow "Nginx Full" && sudo ufw -y enable

sudo cp nginx/forgejo /etc/nginx/sites-available/ && sudo ln -s /etc/nginx/sites-available/forgejo /etc/nginx/sites-enabled/forgejo
sudo systemctl restart nginx.service
