#!/bin/bash

# Colors
GREEN="\033[1;32m"
CYAN="\033[1;36m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
NC="\033[0m"

BOT_PATH="/sdcard/HBWABot-Mz"

# ============== ANIMATION ==============

spinner() {
    local pid=$!
    local delay=0.1
    local spin='|/-\'
    while kill -0 $pid 2>/dev/null; do
        for i in $(seq 0 3); do
            printf "\r${CYAN}⏳ Please wait... ${spin:$i:1}${NC}"
            sleep $delay
        done
    done
    printf "\r${GREEN}✔ Done!                 ${NC}\n"
}

typewriter() {
    text="$1"
    for ((i=0; i<${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep 0.01
    done
    echo ""
}

banner="
██╗  ██╗██████╗ ██╗    ██╗ █████╗ ██████╗  ██████╗ ████████╗
██║  ██║██╔══██╗██║    ██║██╔══██╗██╔══██╗██╔═══██╗╚══██╔══╝
███████║██████╔╝██║ █╗ ██║███████║██████╔╝██║   ██║   ██║   
██╔══██║██╔══██╗██║███╗██║██╔══██║██╔══██╗██║   ██║   ██║   
██║  ██║██████╚███╔███╔╝██║  ██║██████╔╝╚██████╔╝   ██║   
╚═╝  ╚═╝╚═════╝ ╚══╝╚══╝ ╚═╝  ╚═╝╚═════╝  ╚═════╝    ╚═╝   

             HBWABot-Mz Installer
"

clear
echo -e "${GREEN}"
typewriter "$banner"
echo -e "${NC}"

# ============== SETUP STORAGE ==============
echo -e "${YELLOW}📁 Requesting storage permission...${NC}"
termux-setup-storage >/dev/null 2>&1 &
spinner

# ============== PACKAGE UPDATE ==============
echo -e "${CYAN}📦 Updating Termux packages...${NC}"
(apt update -y && apt upgrade -y) >/dev/null 2>&1 &
spinner

# ============== INSTALL DEPENDENCIES ==============
echo -e "${YELLOW}📦 Installing dependencies...${NC}"
(pkg install -y nodejs yarn ffmpeg git jq util-linux) >/dev/null 2>&1 &
spinner

# ============== NODE FIX ==============
echo -e "${CYAN}🔧 Fixing Node cache...${NC}"
(npm cache clean --force) >/dev/null 2>&1 &
spinner

echo -e "${CYAN}🔧 Fixing Yarn config...${NC}"
(yarn config set ignore-engines true) >/dev/null 2>&1 &
spinner

# ============== MOUNT BIND FIX ==============
echo -e "${YELLOW}🔧 Applying storage fix for node_modules...${NC}"
mkdir -p $HOME/hbwa_modules

rm -rf $BOT_PATH/node_modules >/dev/null 2>&1

(mount --bind $HOME/hbwa_modules $BOT_PATH/node_modules) >/dev/null 2>&1 &
spinner

# ============== INSTALL BOT DEPENDENCIES ==============
echo -e "${YELLOW}📦 Installing bot packages (Yarn)...${NC}"
cd $BOT_PATH
(yarn install --force) >/dev/null 2>&1 &
spinner

echo -e "${GREEN}✔ Installation completed successfully!${NC}"
sleep 1

# ================= MENU =================
menu() {
while true; do
clear
echo -e "${GREEN}
━━━━━━━━ HBWABot-Mz Control ━━━━━━━━
${CYAN}1) Start Bot (npm start)
2) Stop Bot
3) Restart Bot
4) Show Bot Logs
5) Generate New QR Code
6) Exit
${NC}"

read -p "Choose: " opt

case $opt in
1)
    echo -e "${YELLOW}▶ Starting bot...${NC}"
    npm start
    ;;
2)
    echo -e "${RED}⛔ Stopping bot...${NC}"
    pkill -f "node index.js"
    ;;
3)
    echo -e "${YELLOW}🔁 Restarting bot...${NC}"
    pkill -f "node index.js"
    npm start
    ;;
4)
    echo -e "${CYAN}📜 Bot Logs (Ctrl + C to stop)...${NC}"
    tail -f logs.txt
    ;;
5)
    echo -e "${CYAN}🔑 Generating QR Code...${NC}"
    node index.js --qr
    ;;
6)
    exit
    ;;
*)
    echo -e "${RED}⚠ Invalid option!${NC}"
    sleep 1
    ;;
esac
done
}

menu
