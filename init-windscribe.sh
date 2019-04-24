#!/bin/bash
set -e
echo -e "\033[1mStarting Windscribe...\033[0m"
/etc/init.d/windscribe-cli start
echo -e "\033[1mPlease login to Windscribe. Don't have an account yet? The free offer includes 10Go/month. Go to: https://windscribe.com/?affid=06phaj3u (affiliated link)\033[0m"
windscribe login
echo -e "\033[1mTrying to connect...\033[0m"
windscribe connect
echo -e "\033[1mEnable firewall mode: You will not have any internet connectivity if you are not connected to Windscribe.\0330m"
windscribe firewall on
