#!/bin/bash
set -e
echo -e "Using OpenDNS as default DNS for security purposes"
echo -e "nameserver 208.67.222.222\nnameserver 208.67.220.220" > /etc/resolv.conf
echo -e "\033[1mStarting Windscribe...\033[0m"
/etc/init.d/windscribe-cli start
echo -e "\033[1mPlease login to Windscribe. Don't have an account yet? The free offer includes 10Go/month. Go to: https://windscribe.com/?affid=06phaj3u (affiliated link)\033[0m"
windscribe login
echo -e "\033[1mTrying to connect (env variable CONNECTION_COUNTRY=$CONNECTION_COUNTRY you can set this env variable to a country abbreviation, ex 'RU')...\033[0m"
windscribe connect $CONNECTION_COUNTRY
echo -e "\033[1mEnable firewall mode: You will not have any internet connectivity if you are not connected to Windscribe.\0330m"
windscribe firewall on
PUBLIC_IP=$(dig +short myip.opendns.com @resolver1.opendns.com)
echo -e "Connected from $PUBLIC_IP [$(geoiplookup $PUBLIC_IP | cut -d ":" -f 2 | sed -e 's/^[ \t]*//')]"
