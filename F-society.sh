#!/data/data/com.termux/files/usr/bin/bash

# ===== COULEURS =====
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
CYAN='\e[36m'
WHITE='\e[37m'
NC='\e[0m'

# ===== FONCTION MENU =====
menu() {
    clear

    # Ligne haute
    echo -e "${YELLOW}=============================================${NC}"

    # Logo F-Society
    echo -e "${RED}"
    cat << "EOF"
███████╗███████╗ ██████╗  ██████╗██╗███████╗████████╗██╗   ██╗
██╔════╝██╔════╝██╔═══██╗██╔════╝██║██╔════╝╚══██╔══╝╚██╗ ██╔╝
█████╗  ███████╗██║   ██║██║     ██║█████╗     ██║    ╚████╔╝
██╔══╝  ╚════██║██║   ██║██║     ██║██╔══╝     ██║     ╚██╔╝
██║     ███████║╚██████╔╝╚██████╗██║███████╗   ██║      ██║
╚═╝     ╚══════╝ ╚═════╝  ╚═════╝╚═╝╚══════╝   ╚═╝      ╚═╝
EOF
    echo -e "${NC}"

    # Auteur
    echo -e "${GREEN}               by : anonymous.dos${NC}"

    # Ligne basse
    echo -e "${YELLOW}=============================================${NC}"
    echo
    echo -e "${CYAN}1) YOUR-IP${NC}"
    echo -e "${CYAN}2) DISCORD server${NC}"
    echo -e "${CYAN}0) LEAVE${NC}"
    echo

    read -p "$(echo -e ${CYAN}'Choisis une option : '${NC})" choix

    case "$choix" in
        1)
            clear
            echo -e "${CYAN}Récupération de ton IP...${NC}"
            IP=$(curl -s https://api.ipify.org)
            echo
            echo -e "${RED}YOUR IP : $IP${NC}"
            echo
            read -p "$(echo -e ${CYAN}'Appuie sur ENTER pour revenir au menu...'"$NC")"
            menu
            ;;

        2)
            clear
            echo -e "${CYAN}Discord server :${NC}"
            echo -e "${WHITE}https://discord.gg/TEdDqwsaAm${NC}"
            echo

            if command -v termux-open-url >/dev/null 2>&1; then
                echo -e "${GREEN}Ouverture automatique du lien...${NC}"
                termux-open-url "https://discord.gg/TEdDqwsaAm"
            else
                echo -e "${YELLOW}Copie le lien et ouvre-le dans ton navigateur.${NC}"
            fi

            echo
            read -p "$(echo -e ${CYAN}'Appuie sur ENTER pour revenir au menu...'"$NC")"
            menu
            ;;

        0)
            clear
            echo -e "${RED}LEAVING F-SOCIETY... 🎭${NC}"
            sleep 1
            exit 0
            ;;

        *)
            echo
            echo -e "${RED}Option invalide !${NC}"
            sleep 1
            menu
            ;;
    esac
}

# ===== LANCEMENT =====
menu
