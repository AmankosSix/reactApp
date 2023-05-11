#!/bin/bash

# Replace the values below with your own settings
SSH_KEY_PATH="/root/.ssh"
DROPLET_USER="root"
DROPLET_IP="64.226.114.69"
APP_NAME="react-app"
LOCAL_BUILD_DIR="./build"
REMOTE_APP_DIR="/etc/nginx/sites-available/$APP_NAME"

# Copy the build files to the droplet
rsync -avz -e "ssh -i $SSH_KEY_PATH" $LOCAL_BUILD_DIR/ $DROPLET_USER@$DROPLET_IP:$REMOTE_APP_DIR

# Restart Nginx to serve the new files
ssh -i $SSH_KEY_PATH $DROPLET_USER@$DROPLET_IP "systemctl restart nginx"
