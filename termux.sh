#!/bin/bash

# Colors
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
NC='\033[0m'

clear

echo -e "${CYAN}🔧 Setting up Termux environment...${NC}"

# Storage permission
echo -e "${YELLOW}Requesting storage permission...${NC}"
termux-setup-storage
sleep 2

# Create safe storage paths
SHARE=~/storage/shared/HBWABot
mkdir -p $SHARE

echo -e "${GREEN}✔ Storage enabled.${NC}"
echo -e "${CYAN}Files will be saved to:${NC} $SHARE"

# Update packages
echo -e "${YELLOW}Updating packages...${NC}"
pkg update -y && pkg upgrade -y

# Install dependencies
echo -e "${YELLOW}Installing required packages...${NC}"
pkg install git nodejs wget curl ffmpeg imagemagick -y

# Clone repo
echo -e "${CYAN}📥 Cloning HBWABot repo...${NC}"
git clone https://github.com/HBMods-OFC/HBWABot-Mz.git

cd HBWABot-Mz || { echo "❌ Folder missing!"; exit 1; }

echo -e "${YELLOW}Installing npm modules...${NC}"
npm install

# Copy config file safely to phone storage
echo -e "${CYAN}📁 Copying settings to phone storage...${NC}"
cp settings.json $SHARE/settings.json

echo -e "${GREEN}✔ settings.json saved to your Internal Storage!${NC}"
echo -e "${CYAN}Path:${NC} $SHARE/settings.json"

# Start script
echo -e "${GREEN}All setup completed!${NC}"
echo -e "${YELLOW}To start the bot run:${NC}"
echo -e "${CYAN}npm start${NC}"
