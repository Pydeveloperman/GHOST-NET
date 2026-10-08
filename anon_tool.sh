#!/bin/bash

# =====================================================================
# KALI LINUX PROFESSIONAL ANONIMLIK VA CUSTOM MAC VOSITASI
# =====================================================================

# Ranglar kodlari
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Tarmoq kartasi nomini avtomatik aniqlash
INTERFACE=$(ip -br link | awk '{print $1}' | grep -E 'wlan|wlp|eth' | head -n 1)


show_menu() {
    clear

    echo -e "${BLUE}"
    cat << "EOF"

   ██████╗ ██╗  ██╗ ██████╗ ███████╗████████╗
  ██╔════╝ ██║  ██║██╔═══██╗██╔════╝╚══██╔══╝
  ██║  ███╗███████║██║   ██║███████╗   ██║
  ██║   ██║██╔══██║██║   ██║╚════██║   ██║
  ╚██████╔╝██║  ██║╚██████╔╝███████║   ██║
   ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝


        ███████╗██╗  ██╗ ██████╗ ███████╗████████╗
        ██╔════╝╚██╗██╔╝██╔═══██╗██╔════╝╚══██╔══╝
        █████╗   ╚███╔╝ ██║   ██║███████╗   ██║
        ██╔══╝   ██╔██╗ ██║   ██║╚════██║   ██║
        ███████╗██╔╝ ██╗╚██████╔╝███████║   ██║
        ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝

EOF
    echo -e "${NC}"

    echo -e "${BLUE}====================================================${NC}"
    echo -e "${YELLOW}       GHOST-NET: ANONIMLIK VA TOZALASH TOOLS${NC}"
    echo -e "${BLUE}====================================================${NC}"
    echo -e "Aniqlangan tarmoq kartasi: ${GREEN}${INTERFACE}${NC}"
    echo "----------------------------------------------------"

    echo -e "1) ${YELLOW}Tasodifiy MAC manzil o'rnatish${NC}"
    echo -e "2) ${GREEN}Aniq MAC manzil kiritish${NC}"
    echo -e "3) ${YELLOW}MAC Manzilni tiklash${NC}"
    echo -e "4) ${YELLOW}Tor & ProxyChains tizimini o'rnatish${NC}"
    echo -e "5) ${YELLOW}Firefox brauzerini ochish${NC}"
    echo -e "6) ${YELLOW}Tizimdagi loglarni tozalash${NC}"
    echo -e "7) ${RED}Chiqish${NC}"

    echo -e "${BLUE}====================================================${NC}"

    read -p "Amalni tanlang [1-7]: " choice

    case "$choice" in
        1) change_mac_random ;;
        2) change_mac_custom ;;
        3) reset_mac ;;
        4) install_tor ;;
        5) launch_firefox ;;
        6) clean_traces ;;
        7) exit 0 ;;
        *)
            echo -e "${RED}Noto'g'ri tanlov!${NC}"
            sleep 1
            show_menu
            ;;
    esac
}


change_mac_random() {
    echo -e "\n${BLUE}[*] MAC manzil tasodifiy qiymatga o'zgartirilmoqda...${NC}"
    sudo ip link set $INTERFACE down
    sudo macchanger -r $INTERFACE
    sudo ip link set $INTERFACE up
    echo -e "${GREEN}[ V ] MAC manzil tasodifiy qiymatga o'zgartirildi!${NC}"
    read -p "Davom etish uchun Enter bosing..." && show_menu
}

change_mac_custom() {
    echo -e "\n${YELLOW}[*] Niqoblanmoqchi bo'lgan qurilma MAC manzilini kiriting.${NC}"
    echo -e "Format namunasi: ${BLUE}AA:BB:CC:DD:EE:FF${NC}"
    read -p "MAC manzil: " custom_mac
    
    # Kiritilgan MAC manzil to'g'riligini tekshirish regexi
    if [[ $custom_mac =~ ^([a-fA-F0-9]{2}:){5}[a-fA-F0-9]{2}$ ]]; then
        echo -e "\n${BLUE}[*] Tarmoq kartasi yangi MAC (${custom_mac}) bilan niqoblanmoqda...${NC}"
        sudo ip link set $INTERFACE down
        sudo macchanger -m "$custom_mac" $INTERFACE
        sudo ip link set $INTERFACE up
        echo -e "${GREEN}[ V ] Muvaffaqiyatli niqoblandi! Tarmoqda siz endi o'sha qurilmasiz.${NC}"
    else
        echo -e "${RED}\n[ X ] Xatolik: MAC manzil formati noto'g'ri kiritildi!${NC}"
    fi
    read -p "Davom etish uchun Enter bosing..." && show_menu
}

reset_mac() {
    echo -e "\n${BLUE}[*] Asl MAC manzil tiklanmoqda...${NC}"
    sudo ip link set $INTERFACE down
    sudo macchanger -p $INTERFACE
    sudo ip link set $INTERFACE up
    echo -e "${GREEN}[ V ] Zavod MAC manzili qaytarildi!${NC}"
    read -p "Davom etish uchun Enter bosing..." && show_menu
}

install_tor() {
    echo -e "\n${BLUE}[*] Tor va ProxyChains xizmatlari tekshirilmoqda...${NC}"
    sudo apt update && sudo apt install tor proxychains4 macchanger -y
    sudo systemctl enable --now tor
    echo -e "${GREEN}[ V ] Tizim anonimlikka tayyor!${NC}"
    read -p "Davom etish uchun Enter bosing..." && show_menu
}

launch_firefox() {
    if ! systemctl is-active --quiet tor; then
        echo -e "${YELLOW}[*] Tor xizmati o'chiq ekan. Ishga tushirilmoqda...${NC}"
        sudo systemctl start tor
        sleep 2
    fi
    echo -e "\n${GREEN}[*] Firefox Tor tarmog'i orqali ochilmoqda...${NC}"
    proxychains4 firefox >/dev/null 2>&1 &
    sleep 2
    show_menu
}

clean_traces() {
    echo -e "\n${RED}[*] Tizimdagi loglar va buyruqlar tarixi o'chirilmoqda...${NC}"
    rm -f ~/.bash_history ~/.zsh_history
    sudo rm -rf /tmp/*
    rm -rf ~/.local/share/Trash/*
    history -c
    echo -e "${GREEN}[ V ] Barcha mahalliy izlar va keshlar tozalandi!${NC}"
    read -p "Davom etish uchun Enter bosing..." && show_menu
}

# Skriptni boshlash
show_menu
