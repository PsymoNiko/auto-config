#!/bin/bash


# Define colors
RED="\033[1;31m"
GREEN="\033[1;32m"
BLUE="\033[1;34m"
CYAN="\033[1;36m"
YELLOW="\033[1;33m"
MAGENTA="\033[1;35m"
RESET="\033[0m"

# Display introduction
echo -e "${CYAN}Yo! I'm ${RED}Ali ${GREEN}Mohammadnia${RESET},"
echo -e "${YELLOW}but you can call me ${MAGENTA}PsymoNiko${RESET}!"
echo -e "\nVisit my GitHub for more projects: \033[1;34mhttps://github.com/psymoniko\033[0m"
echo -e "${BLUE}Code wizard, tech dreamer, and life hacker at heart.${RESET}"
echo -e "${CYAN}Let's turn ideas into reality! 🚀${RESET}"



cat << "EOF"
    _         _         ____             __ _       
   / \  _   _| |_ ___  / ___|___  _ __  / _(_) __ _ 
  / _ \| | | | __/ _ \| |   / _ \| '_ \| |_| |/ _` |
 / ___ \ |_| | || (_) | |__| (_) | | | |  _| | (_| |
/_/   \_\__,_|\__\___/ \____\___/|_| |_|_| |_|\__, |
                                              |___/ 
EOF




# Define colors for output
YELLOW="\033[1;33m"
GREEN="\033[1;32m"
RED="\033[1;31m"
RESET="\033[0m"

# Function to install a list of packages and display status
install_packages() {
    local package_manager=$1
    shift
    local packages=("$@")
    
    for package in "${packages[@]}"; do
        echo -e "${YELLOW}Installing ${package}...${RESET}"
        if sudo $package_manager install -y "$package" > /dev/null 2>&1; then
            echo -e "${GREEN}${package} installed successfully!${RESET}"
        else
            echo -e "${RED}Failed to install ${package}.${RESET}"
        fi
    done
}

# Function to handle Fedora installation
install_fedora() {
    echo "You selected Fedora."
    echo "What do you want to install?"
    echo "1) Network Tools"
    echo "2) Coding Tools"
    echo "3) Other Tools"
    read -p "Enter your choice (1, 2, or 3): " choice

    case $choice in
        1)
            install_packages "dnf" nload iftop bmon vnstat tcpdump nethogs htop glances iperf3
            ;;
        2)
            install_packages "dnf" git vim emacs code gcc g++ python3 python3-pip
            ;;
        3)
            install_packages "dnf" curl wget tmux zsh neofetch toilet figlet
            ;;
        *)
            echo -e "${RED}Invalid choice. Exiting.${RESET}"
            exit 1
            ;;
    esac
}

# Function to handle Ubuntu installation
install_ubuntu() {
    echo "You selected Ubuntu."
    echo "What do you want to install?"
    echo "1) Network Tools"
    echo "2) Coding Tools"
    echo "3) Other Tools"
    read -p "Enter your choice (1, 2, or 3): " choice

    case $choice in
        1)
            install_packages "apt" nload iftop bmon vnstat tcpdump nethogs htop glances iperf3 toilet
            ;;
        2)
            install_packages "apt" git vim emacs code gcc g++ python3 python3-pip
            ;;
        3)
            install_packages "apt" curl wget tmux zsh neofetch
            ;;
        *)
            echo -e "${RED}Invalid choice. Exiting.${RESET}"
            exit 1
            ;;
    esac
}

# Prompt user to select their OS
echo "Which operating system are you using?"
echo "1) Fedora"
echo "2) Ubuntu"
read -p "Enter the number corresponding to your OS (1 or 2): " os_choice

# Perform installation based on user choice
case $os_choice in
    1)
        install_fedora
        ;;
    2)
        install_ubuntu
        ;;
    *)
        echo -e "${RED}Invalid choice. Please run the script again and select 1 or 2.${RESET}"
        exit 1
        ;;
esac

# Confirm completion
echo -e "${GREEN}All selected tools have been processed successfully!${RESET}"

