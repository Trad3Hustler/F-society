#!/bin/bash

# Couleurs
RED='\e[31m'
WHITE='\e[37m'
CYAN='\e[36m'
NC='\e[0m'

clear
echo -e "${RED}===============================${NC}"
echo -e "${RED}   F-society 🎭${NC}"
echo -e "${WHITE}  by : anonymous.dos${NC}"
echo -e "${RED}===============================${NC}"
echo
echo -e "${CYAN}1) YOUR-IP${NC}"
echo -e "${CYAN}2) DISCORD server${NC}"
echo -e "${CYAN}0) LEAVE${NC}"
echo
read -p "$(echo -e ${CYAN}'Choisis une option : '${NC})" choix

case $choix in
  1)
    echo
    echo -e "${CYAN}Récupération de ton IP...${NC}"
    IP=$(curl -s https://api.ipify.org)
    echo -e "${RED}YOUR IP : $IP${NC}"
    ;;
  2)
    echo -e "${CYAN}Discord server :${NC}"
    echo -e "${WHITE}https://discord.gg/TEdDqwsaAm${NC}"
    ;;
  0)
    echo -e "${RED}LEAVING...${NC}"
    exit
    ;;
  *)
    echo -e "${RED}Option invalide${NC}"
    ;;
esac
