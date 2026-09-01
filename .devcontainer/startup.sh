#!/bin/bash
set -e

curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscaled --tun=userspace-networking --socks5-server=localhost:1055 &
sleep 4
sudo tailscale up --authkey="tskey-auth-kp4D8uZ79V11CNTRL-cwVtEnFQAEcnJsRVMK4YDcDrrygXERVa" --hostname="codespace-desktop"

bash /workspaces/THE-LINUX/start-desktop-vnc.sh &
