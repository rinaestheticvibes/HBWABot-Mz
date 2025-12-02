#!/bin/bash

# Color Codes
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
NC='\033[0m'

clear

# Animation Frames
frames=(
"
       ☢️        
     ☢️☢️☢️      
   ☢️☢️☢️☢️☢️    
 ☢️☢️☢️☢️☢️☢️☢️  
☢️☢️☢️☢️☢️☢️☢️☢️☢️
"
"
       🔥🔥        
     🔥🔥🔥🔥      
   🔥🔥🔥🔥🔥🔥    
 🔥🔥🔥🔥🔥🔥🔥🔥  
🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥
"
"
       🔥🔥        
     🔥🔥🔥🔥      
   🔥🔥🔥🔥🔥🔥    
 🔥🔥🔥🔥🔥🔥🔥🔥  
🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥
"
"
       ☁️☁️☁️       
     ☁️☁️☁️☁️☁️     
   ☁️☁️☁️☁️☁️☁️☁️   
 ☁️☁️☁️☁️☁️☁️☁️☁️☁️ 
☁️☁️☁️☁️☁️☁️☁️☁️☁️☁️☁️
"
)

# Display Animation
for i in {1..2}; do
  for frame in "${frames[@]}"; do
    clear
    echo -e "$RED$frame$NC"
    sleep 0.2
  done
done

echo -e "\n${GREEN}🚀 HBWABot Installation Starting...${NC}"
sleep 1

# Update System
echo -e "${YELLOW}🔧 Updating packages...${NC}"
apt update && apt upgrade -y

# Install Required Packages
echo -e "${YELLOW}📦 Installing dependencies...${NC}"
apt install -y libwebp git nodejs ffmpeg wget imagemagick

# Allow Storage Access
echo -e "${YELLOW}📂 Setting up Termux storage...${NC}"
termux-setup-storage

# Install Yarn
echo -e "${YELLOW}📥 Installing Yarn...${NC}"
npm install -g yarn

# Clone Repo
echo -e "${YELLOW}🔄 Cloning HBWABot repository...${NC}"
git clone https://github.com/HBMods-OFC/HBWABot-Mz.git

cd HBWABot-Mz || { echo "Folder missing!"; exit; }

# Edit settings.json Reminder
echo -e "${CYAN}⚙️ Before running the bot, edit 'settings.json'!${NC}"
echo -e "${GREEN}Use: ${YELLOW}nano settings.json${NC}"

# Install Node Modules
echo -e "${YELLOW}📦 Installing bot dependencies...${NC}"
yarn install

# Start Bot
echo -e "${YELLOW}🚀 Starting HBWABot...${NC}"
npm start

echo -e "${GREEN}✔️ Installation Complete!${NC}"
echo -e "${CYAN}🎉 HBWABot is Now Running! 🎉${NC}"
