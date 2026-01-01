#!/data/data/com.termux/files/usr/bin/bash

# ===== COULEURS =====
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
CYAN='\e[36m'
WHITE='\e[37m'
NC='\e[0m'

# ===== VALIDATION IP =====
valid_ip() {
    local ip=$1

    # IPv4
    if [[ $ip =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
        for o in $(echo "$ip" | tr "." " "); do
            ((o >= 0 && o <= 255)) || return 1
        done
        return 0
    fi

    # IPv6
    if [[ $ip =~ ^([0-9a-fA-F]{1,4}:){1,7}[0-9a-fA-F]{1,4}$ ]]; then
        return 0
    fi

    return 1
}

# ===== MENU =====
menu() {
    clear
    echo -e "${YELLOW}=============================================${NC}"

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

    echo -e "${GREEN}               by : anonymous.dos${NC}"
    echo -e "${YELLOW}=============================================${NC}"
    echo
    echo -e "${CYAN}1) YOUR IP${NC}"
    echo -e "${CYAN}2) DISCORD SERVER${NC}"
    echo -e "${CYAN}3) IP LOOKUP (FULL)${NC}"
    echo -e "${CYAN}0) LEAVE${NC}"
    echo

    read -p "$(echo -e ${CYAN}'Choisis une option : '${NC})" choix

    case "$choix" in

        1)
            clear
            IP=$(curl -s https://api.ipify.org)
            echo -e "${YELLOW}YOUR IP : $IP${NC}"
            echo
            read -p "$(echo -e ${CYAN}'ENTER pour revenir...'"$NC")"
            menu
            ;;

        2)
            clear
            echo -e "${WHITE}https://discord.gg/TEdDqwsaAm${NC}"
            termux-open-url "https://discord.gg/TEdDqwsaAm" 2>/dev/null
            echo
            read -p "$(echo -e ${CYAN}'ENTER pour revenir...'"$NC")"
            menu
            ;;

        3)
            clear
            echo -e "${CYAN}Entre une adresse IP :${NC}"
            read ip
            echo

            if valid_ip "$ip"; then
                echo -e "${GREEN}IP VALIDE ✅${NC}"
            else
                echo -e "${RED}IP INVALIDE ❌${NC}"
                sleep 2
                menu
            fi

            echo
            echo -e "${YELLOW}Lookup en cours pour $ip ...${NC}"
            echo

            DATA=$(curl -s https://ipinfo.io/$ip/json)

            echo -e "${YELLOW}========== IP INFORMATION ==========${NC}"
            echo -e "${YELLOW}IP Address   : $(echo "$DATA" | grep '"ip"' | cut -d '"' -f4)${NC}"
            echo -e "${YELLOW}Hostname     : $(echo "$DATA" | grep '"hostname"' | cut -d '"' -f4)${NC}"
            echo -e "${YELLOW}Pays         : $(echo "$DATA" | grep '"country"' | cut -d '"' -f4)${NC}"
            echo -e "${YELLOW}Région       : $(echo "$DATA" | grep '"region"' | cut -d '"' -f4)${NC}"
            echo -e "${YELLOW}Ville        : $(echo "$DATA" | grep '"city"' | cut -d '"' -f4)${NC}"
            echo -e "${YELLOW}Code Postal  : $(echo "$DATA" | grep '"postal"' | cut -d '"' -f4)${NC}"
            echo -e "${YELLOW}Timezone     : $(echo "$DATA" | grep '"timezone"' | cut -d '"' -f4)${NC}"
            echo -e "${YELLOW}Organisation : $(echo "$DATA" | grep '"org"' | cut -d '"' -f4)${NC}"
            echo -e "${YELLOW}Coordonnées  : $(echo "$DATA" | grep '"loc"' | cut -d '"' -f4)${NC}"
            echo -e "${YELLOW}Google Maps  : https://www.google.com/maps?q=$(echo "$DATA" | grep '"loc"' | cut -d '"' -f4)${NC}"
            echo -e "${YELLOW}====================================${NC}"

            echo
            read -p "$(echo -e ${CYAN}'ENTER pour revenir au menu...'"$NC")"
            menu
            ;;

        0)
            clear
            echo -e "${RED}LEAVING F-SOCIETY... 🎭${NC}"
            sleep 1
            exit
            ;;

        *)
            echo -e "${RED}Option invalide${NC}"
            sleep 1
            menu
            ;;
    esac
}

menu
