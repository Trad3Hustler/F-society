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
    if [[ $ip =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
        for o in $(echo "$ip" | tr "." " "); do
            ((o >= 0 && o <= 255)) || return 1
        done
        return 0
    fi
    return 1
}

# ===== DISCORD ID OSINT =====
discord_id_info() {
    clear
    echo -e "${CYAN}Entre un ID Discord :${NC}"
    read did

    if ! [[ "$did" =~ ^[0-9]{17,19}$ ]]; then
        echo -e "${RED}ID Discord invalide ❌${NC}"
        sleep 2
        menu
    fi

    DISCORD_EPOCH=1420070400000

    timestamp=$(( (did >> 22) + DISCORD_EPOCH ))
    unix_time=$((timestamp / 1000))
    created=$(date -d @"$unix_time" "+%d/%m/%Y %H:%M:%S")

    now=$(date +%s)
    age_days=$(((now - unix_time) / 86400))
    age_years=$((age_days / 365))

    worker_id=$(( (did & 0x3E0000) >> 17 ))
    process_id=$(( (did & 0x1F000) >> 12 ))
    increment=$(( did & 0xFFF ))

    echo
    echo -e "${YELLOW}========== DISCORD ID OSINT ==========${NC}"
    echo -e "${GREEN}ID Discord        : $did${NC}"
    echo -e "${GREEN}Créé le           : $created${NC}"
    echo -e "${GREEN}Âge du compte     : ~$age_years ans ($age_days jours)${NC}"
    echo -e "${GREEN}Worker ID         : $worker_id${NC}"
    echo -e "${GREEN}Process ID        : $process_id${NC}"
    echo -e "${GREEN}Increment         : $increment${NC}"
    echo -e "${YELLOW}=====================================${NC}"
    echo
    read -p "$(echo -e ${CYAN}'ENTER pour revenir...'${NC})"
    menu
}

# ===== MENU =====
menu() {
    clear
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

    echo -e "                                       𝚅𝟷.𝟼${NC}"
    echo -e "${CYAN}               by : ice${NC}"
    echo -e "${GREEN}               by : Anonymous.dos${NC}"
    echo -e "${YELLOW}==========================================${NC}"
    echo
    echo -e "${RED}[${WHITE}1${RED}] ${YELLOW}YOUR IP${NC}"
    echo -e "${RED}[${WHITE}2${RED}] ${YELLOW}DISCORD SERVER${NC}"
    echo -e "${RED}[${WHITE}3${RED}] ${YELLOW}IP LOOKUP${NC}"
    echo -e "${RED}[${WHITE}4${RED}] ${YELLOW}DISCORD ID OSINT${NC}"
    echo -e "${RED}[${WHITE}0${RED}] ${YELLOW}LEAVE${NC}"
    echo

    read -p "$(echo -e ${CYAN}'Choisis une option : '${NC})" choix

    case "$choix" in
        1)
            clear
            IP=$(curl -s https://api.ipify.org)
            echo -e "${YELLOW}YOUR IP : $IP${NC}"
            echo
            read -p "$(echo -e ${CYAN}'ENTER pour revenir...'${NC})"
            menu
            ;;
        2)
            clear
            echo -e "${WHITE}https://discord.gg/TEdDqwsaAm${NC}"
            termux-open-url "https://discord.gg/TEdDqwsaAm" 2>/dev/null
            echo
            read -p "$(echo -e ${CYAN}'ENTER pour revenir...'${NC})"
            menu
            ;;
        3)
            clear
            echo -e "${CYAN}Entre une adresse IP :${NC}"
            read ip

            if ! valid_ip "$ip"; then
                echo -e "${RED}IP invalide ❌${NC}"
                sleep 2
                menu
            fi

            DATA=$(curl -s https://ipinfo.io/$ip/json)
            echo
            echo -e "${YELLOW}========== IP INFO ==========${NC}"
            echo "$DATA"
            echo -e "${YELLOW}=============================${NC}"

            echo
            read -p "$(echo -e ${CYAN}'ENTER pour revenir...'${NC})"
            menu
            ;;
        4)
            discord_id_info
            ;;
        0)
            clear
            echo -e "${RED}LEAVING...${NC}"
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
