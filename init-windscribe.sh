#!/bin/bash
set -e
echo "Starting Windscribe..."
/etc/init.d/windscribe-cli start
echo "Please ogin to Windscribe. Don't have an account yet? The free offer includes 10Go/month. Go to: https://windscribe.com/?affid=06phaj3u (affiliated link)"
windscribe login
echo "Trying to connect..."
windscribe connect