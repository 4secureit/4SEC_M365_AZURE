#!/bin/bash
# Ścieżka instalacji: /opt/4sec_M365_Azure/
# Autor: KCHWEDYNA

# Efekt wizualny na początku
echo -e "\033[1;34m"
echo -e "██╗  ██╗███████╗███████╗ ██████╗        ███╗   ███╗██████╗  ██████╗ ███████╗         █████╗ ███████╗██╗   ██╗██████╗ ███████╗"
echo -e "██║  ██║██╔════╝██╔════╝██╔════╝        ████╗ ████║╚════██╗██╔════╝ ██╔════╝        ██╔══██╗╚══███╔╝██║   ██║██╔══██╗██╔════╝"
echo -e "███████║███████╗█████╗  ██║             ██╔████╔██║ █████╔╝███████╗ ███████╗        ███████║  ███╔╝ ██║   ██║██████╔╝█████╗  "
echo -e "╚════██║╚════██║██╔══╝  ██║             ██║╚██╔╝██║ ╚═══██╗██╔═══██╗╚════██║        ██╔══██║ ███╔╝  ██║   ██║██╔══██╗██╔══╝  "
echo -e "     ██║███████║███████╗╚██████╗███████╗██║ ╚═╝ ██║██████╔╝╚██████╔╝███████║███████╗██║  ██║███████╗╚██████╔╝██║  ██║███████╗"
echo -e "     ╚═╝╚══════╝╚══════╝ ╚═════╝╚══════╝╚═╝     ╚═╝╚═════╝  ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝\033[0m"
echo -e "\033[1;32m                                                                                                                              by KCHWEDYNA\033[0m\n"

# Pobranie uprawnień sudo
username=$(id -u -n 1000)
arch=$(uname -m)
sudo -v

# Przygotowanie środowiska
install_dir=/opt/4sec_M365_Azure/
sudo mkdir -p "$install_dir"
sudo chown $username:$username $install_dir
sudo apt update && sudo apt install unzip curl hashcat evil-winrm pipx docker.io docker-compose -y

# Instalacja narzędzi Powershell
git clone https://github.com/Gerenios/AADInternals $install_dir/AADInternals
git clone https://github.com/dafthack/GraphRunner $install_dir/GraphRunner
git clone https://github.com/f-bader/TokenTacticsV2 $install_dir/TokenTacticsV2
git clone https://github.com/dafthack/MFASweep $install_dir/MFASweep

# Instalacja narzędzi Python
git clone https://github.com/yuyudhn/AzSubEnum $install_dir/AzSubEnum
git clone https://github.com/joswr1ght/basicblobfinder $install_dir/basicblobfinder
git clone https://github.com/gremwell/o365enum $install_dir/o365enum
git clone https://github.com/0xZDH/o365spray $install_dir/o365spray
git clone https://github.com/0xZDH/Omnispray $install_dir/Omnispray
git clone https://github.com/dievus/Oh365UserFinder $install_dir/Oh365UserFinder

sudo mkdir -p $install_dir/exfil_exchange_mail
sudo chown $username:$username $install_dir/exfil_exchange_mail
wget https://raw.githubusercontent.com/rootsecdev/Azure-Red-Team/master/Tokens/exfil_exchange_mail.py -O $install_dir/exfil_exchange_mail/exfil_exchange_mail.py

# Instalacja narzędzi pip i pipx
pipx ensurepath --global
pipx install azure-cli
pipx install graphspy
pipx install "git+https://github.com/dirkjanm/ROADtools" --include-deps
pip install requests colorama

# Konfiguracja Dockera do działania w kontekście użytkownika
sudo usermod -aG docker $username

# Pobranie odpowiedniej wersji AzureHound w zależności od architektury systemu
file_name=""
case $arch in
    x86_64)
        file_name="azurehound-linux-amd64.zip"
        ;;
    arm64 | aarch64)
        file_name="azurehound-linux-arm64.zip"
        ;;
    *)
        echo "Nieobsługiwana architektura: $arch"
        exit 1
        ;;
esac

wget https://github.com/BloodHoundAD/AzureHound/releases/download/v2.1.7/${file_name} -O azurehound.zip
unzip azurehound.zip
mkdir azure_hound
mv ./azurehound azure_hound/
rm azurehound.zip

# Instalacja BloodHoundCE za pomocą Docker Compose
mkdir -p $install_dir/BloodhoundCE
curl https://raw.githubusercontent.com/SpecterOps/BloodHound/main/examples/docker-compose/docker-compose.yml -o /opt/4sec_M365_Azure/BloodhoundCE/docker-compose.yml

# Czynności końcowe po instalacji
clear

echo "Instalacja zakończona pomyślnie!"
