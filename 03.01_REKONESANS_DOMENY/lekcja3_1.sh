#!/bin/bash
echo -e "\033[1;34m██╗  ██╗███████╗███████╗ ██████╗        ███╗   ███╗██████╗  ██████╗ ███████╗         █████╗ ███████╗██╗   ██╗██████╗ ███████╗"
echo -e "██║  ██║██╔════╝██╔════╝██╔════╝        ████╗ ████║╚════██╗██╔════╝ ██╔════╝        ██╔══██╗╚══███╔╝██║   ██║██╔══██╗██╔════╝"
echo -e "███████║███████╗█████╗  ██║             ██╔████╔██║ █████╔╝███████╗ ███████╗        ███████║  ███╔╝ ██║   ██║██████╔╝█████╗  "
echo -e "╚════██║╚════██║██╔══╝  ██║             ██║╚██╔╝██║ ╚═══██╗██╔═══██╗╚════██║        ██╔══██║ ███╔╝  ██║   ██║██╔══██╗██╔══╝  "
echo -e "     ██║███████║███████╗╚██████╗███████╗██║ ╚═╝ ██║██████╔╝╚██████╔╝███████║███████╗██║  ██║███████╗╚██████╔╝██║  ██║███████╗"
echo -e "     ╚═╝╚══════╝╚══════╝ ╚═════╝╚══════╝╚═╝     ╚═╝╚═════╝  ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝\033[0m"
echo -e "\033[1;32m                                                                                                                              by KCHWEDYNA\033[0m\n"
echo

if [ -z "$1" ]; then
    echo "Użycie: $0 domena.pl"
    exit 1
fi

DOMAIN="$1"

echo -e "\033[1;34m# --- Sprawdzanie rekordów TXT (np. SPF, DKIM, DMARC) ---\033[0m"
dig "$DOMAIN" TXT +short
echo

echo -e "\033[1;34m# --- Sprawdzanie rekordu SPF ---\033[0m"
dig "$DOMAIN" TXT +short | grep "v=spf1"
echo

echo -e "\033[1;34m# --- Sprawdzanie rekordów MX ---\033[0m"
dig "$DOMAIN" MX +short
echo

echo -e "\033[1;34m# --- Sprawdzanie rekordu CNAME dla autodiscover ---\033[0m"
dig autodiscover."$DOMAIN" CNAME +short
echo

echo -e "\033[1;33mUwaga: Aby uzyskać więcej informacji (np. status federacji), rozważ użycie modułu AADInternals w PowerShell.\033[0m"
echo -e "\033[1;32mPrzykładowe polecenia AADInternals (uruchom w PowerShell):\033[0m"
echo -e "\033[1;32m# Get-AADIntLoginInformation -UserName 'test@$DOMAIN'\033[0m"
echo -e "\033[1;32m# Invoke-AADIntReconAsOutsider -Domain '$DOMAIN'\033[0m"
echo
