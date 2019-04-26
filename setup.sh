#!/bin/bash
set -e

#
# Install windscribe
#
apt update
apt-get install -y apt-transport-https ca-certificates curl software-properties-common iptables
# This command is a little bit capricious (gpg: keyserver receive failed: No route to host)
until apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-key FDC247B7
do
  echo "Try again..."
done
echo 'deb https://repo.windscribe.com/ubuntu zesty main' | tee /etc/apt/sources.list.d/windscribe-repo.list
apt update
# Usually, resolvconf is linked to resolvconf from host.
echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections
apt install -y resolvconf
apt install -y windscribe-cli

# Common tools to check tht everything is alright
apt-get install -y vim dnsutils geoip-bin

#
# Cleaning the cache to limit the size of the image
#
apt clean
