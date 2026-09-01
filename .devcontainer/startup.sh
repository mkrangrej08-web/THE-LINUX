#!/bin/bash
sudo tailscaled --tun=userspace-networking --socks5-server=localhost:1055 &
sleep 3
sudo tailscale up --authkey="tskey-auth-kp4D8uZ79V11CNTRL-cwVtEnFQAEcnJsRVMK4YDcDrrygXERVa" --hostname="codespace-desktop"

if [ -f "/workspaces/THE-LINUX/start-desktop-vnc.sh" ]; then
    bash /workspaces/THE-LINUX/start-desktop-vnc.sh &
fi
