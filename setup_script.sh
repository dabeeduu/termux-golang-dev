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
proot-distro install ubuntu -y

# Log into Ubuntu
proot-distro login ubuntu

# Inside Ubuntu - update and upgrade
apt update -y
apt upgrade -y

# Install sudo
apt install sudo -y

# Add the user and set the password
adduser $username <<EOF
$password
$password
EOF

# Edit sudoers file to give new user sudo privileges
echo "$username ALL=(ALL:ALL) ALL" >> /etc/sudoers

# Exit back to Termux
exit

# Download a login script from a remote URL
wget -O login_script.sh https://www.test.com
