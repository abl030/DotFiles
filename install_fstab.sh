#!/bin/bash

# Prompt for username and password
read -p "Enter your SMB username: " smb_username
read -s -p "Enter your SMB password: " smb_password
echo

# Make our mount directory
sudo mkdir -p /mnt/data/

# Install cifs-utils
sudo apt update
sudo apt install -y cifs-utils

# Create the credentials file
credentials_file="/home/abl030/.smbcredentials"
echo "username=$smb_username" | sudo tee $credentials_file > /dev/null
echo "password=$smb_password" | sudo tee -a $credentials_file > /dev/null

# Change permissions of the credentials file
sudo chmod 600 $credentials_file

# Add the mount to the fstab file
echo "//192.168.1.2/data/ /mnt/data/ cifs credentials=$credentials_file,uid=abl030,gid=users,noperm 0 0" | sudo tee -a /etc/fstab

# Mount all filesystems
sudo mount -a

echo "SMB share mounted successfully."

