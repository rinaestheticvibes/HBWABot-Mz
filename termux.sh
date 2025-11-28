#!/bin/bash

# Define colors
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
NC='\033[0m' # No Color

clear

# Multi-line Nuclear Explosion Animation â˜¢ï¸ðŸ’¥
frames=(
"
         â˜¢ï¸         
       â˜¢ï¸â˜¢ï¸â˜¢ï¸       
     â˜¢ï¸â˜¢ï¸â˜¢ï¸â˜¢ï¸â˜¢ï¸     
   â˜¢ï¸â˜¢ï¸â˜¢ï¸â˜¢ï¸â˜¢ï¸â˜¢ï¸â˜¢ï¸   
 â˜¢ï¸â˜¢ï¸â˜¢ï¸â˜¢ï¸â˜¢ï¸â˜¢ï¸â˜¢ï¸â˜¢ï¸â˜¢ï¸ 
â˜¢ï¸â˜¢ï¸â˜¢ï¸â˜¢ï¸â˜¢ï¸â˜¢ï¸â˜¢ï¸â˜¢ï¸â˜¢ï¸â˜¢ï¸â˜¢ï¸
"
"
        ðŸ’¥ðŸ’¥        
      ðŸ’¥ðŸ’¥ðŸ’¥ðŸ’¥      
    ðŸ’¥ðŸ’¥ðŸ’¥ðŸ’¥ðŸ’¥ðŸ’¥    
  ðŸ’¥ðŸ’¥ðŸ’¥ðŸ’¥ðŸ’¥ðŸ’¥ðŸ’¥ðŸ’¥  
ðŸ’¥ðŸ’¥ðŸ’¥ðŸ’¥ðŸ’¥ðŸ’¥ðŸ’¥ðŸ’¥ðŸ’¥ðŸ’¥
"
"
        ðŸ”¥ðŸ”¥        
      ðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥      
    ðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥    
  ðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥  
ðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥ðŸ”¥
"
"
       â˜ï¸â˜ï¸â˜ï¸       
     â˜ï¸â˜ï¸â˜ï¸â˜ï¸â˜ï¸     
   â˜ï¸â˜ï¸â˜ï¸â˜ï¸â˜ï¸â˜ï¸â˜ï¸   
 â˜ï¸â˜ï¸â˜ï¸â˜ï¸â˜ï¸â˜ï¸â˜ï¸â˜ï¸â˜ï¸ 
â˜ï¸â˜ï¸â˜ï¸â˜ï¸â˜ï¸â˜ï¸â˜ï¸â˜ï¸â˜ï¸â˜ï¸â˜ï¸
"
)

for i in {1..2}; do
  for frame in "${frames[@]}"; do
    clear
    echo -e "$RED$frame$NC"
    sleep 0.3
  done
done

echo -e "\n${GREEN}ðŸš€ HBWABot Installation Starting...${NC}"
sleep 1

# Update and Upgrade System
echo -e "${YELLOW}ðŸ”„ Updating system packages...${NC}"
apt update && apt upgrade -y

# Install Dependencies
echo -e "${YELLOW}ðŸ“¦ Installing necessary dependencies...${NC}"
apt install -y bash libwebp git nodejs ffmpeg wget imagemagick

# Setup Storage
echo -e "${YELLOW}ðŸ“‚ Setting up Termux storage...${NC}"
termux-setup-storage

# Install Yarn
echo -e "${YELLOW}ðŸ“¥ Installing Yarn globally via npm...${NC}"
npm install -g yarn

# Clone Repository
echo -e "${YELLOW}ðŸ› ï¸ Cloning HBWABot repository...${NC}"
git clone https://github.com/HBMods-OFC/HBWABot-Mz.git

# Navigate to Bot Folder
echo -e "${YELLOW}ðŸ“‚ Entering HBWABot directory...${NC}"
cd HBWABot-Mz

# Inform user to edit settings.json
echo -e "${CYAN}âš™ï¸ Edit 'settings.json' before running the bot!${NC}"
echo -e "${GREEN}ðŸ“œ Use: ${YELLOW}nano settings.json${NC} ${GREEN}to modify bot settings.${NC}"

# Install Dependencies
echo -e "${YELLOW}ðŸ“¦ Installing bot dependencies...${NC}"
yarn install

# Start Bot
echo -e "${YELLOW}ðŸš€ Starting the bot...${NC}"
npm start

# Final Message
echo -e "${GREEN}âœ… Installation Complete!${NC}"
echo -e "${CYAN}â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•"
echo -e "       ðŸŽ‰ HBWABot is Now Running! ðŸŽ‰"
echo -e "â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•${NC}"