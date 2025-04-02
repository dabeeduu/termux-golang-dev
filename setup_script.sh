#!/bin/bash

# Prompt for username and password
echo "Enter the desired username:"
read username

echo "Enter the desired password:"
read -s password

# Confirm the password
echo "Confirm the password:"
read -s password_confirm

# Check if passwords match
if [ "$password" != "$password_confirm" ]; then
    echo "Passwords do not match. Exiting."
    exit 1
fi

# Update and Upgrade Termux
pkg update -y
pkg upgrade -y

# Install X11 repositories and tools
pkg install x11-repo -y
pkg install termux-x11-nightly -y
pkg install xfce -y
pkg install proot-distro -y

# Install and configure Ubuntu in Termux
pkg install proot-distro -y
proot-distro install ubuntu

# Log into Ubuntu
proot-distro login ubuntu -- /bin/bash -c "
  # Inside Ubuntu - update and upgrade
  apt update -y
  apt upgrade -y

  # Install sudo
  apt install sudo go -y

  # Create user with disabled password first
  adduser --disabled-password --gecos '' $username

  # Set password using chpasswd
  echo '$username:$password' | chpasswd
  # Add user to sudoers
  echo \"$username  ALL=(ALL:ALL) ALL\" >> /etc/sudoers

  # Installing code-server for developement in browser
  curl -fsSL https://code-server.dev/install.sh | sh

  exit
"

