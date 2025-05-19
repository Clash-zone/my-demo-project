#!/bin/bash

# Outline VPN Server Installation Script

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1

fi

# Function to display script usage
usage() {
  echo "Usage: $0 [-k API_KEY] [-d DOMAIN]"
  echo "  -k API_KEY   : Outline server API key"
  echo "  -d DOMAIN    : Domain name (optional)"
  exit 1
}

# Parse command line arguments
while getopts "k:d:" opt; do
  case $opt in
    k) API_KEY="$OPTARG" ;;
    d) DOMAIN="$OPTARG" ;;
    ?) usage ;;
  esac
done

# Check if API key is provided
if [ -z "$API_KEY" ]; then
  echo "Error: API key is required"
  usage
fi

# Install Docker if not installed
if ! command -v docker &> /dev/null; then
  echo "Installing Docker..."
  curl -fsSL https://get.docker.com -o get-docker.sh
  sh get-docker.sh
  systemctl enable docker
  systemctl start docker
fi

# Download and install Outline
wget -qO- https://raw.githubusercontent.com/Jigsaw-Code/outline-server/master/src/server_manager/install_scripts/install_server.sh | bash

# Configure Outline
if [ ! -z "$DOMAIN" ]; then
  # Setup with domain
  echo "Configuring Outline with domain: $DOMAIN"
  # Add domain configuration here
fi

# Set API key
echo "$API_KEY" > /opt/outline/access.txt

# Start Outline service
systemctl enable outline-server
systemctl start outline-server

echo "Outline VPN Server installation completed!"
