#!/bin/bash
vncserver -kill :1 >/dev/null 2>&1 || true
vncserver :1 -geometry 1280x720 -depth 24 -localhost no
pkill ngrok >/dev/null 2>&1 || true
ngrok tcp 5901 > /dev/null 2>&1 &
sleep 4
echo "=========================================="
echo "VNC Server running on Port 5901"
echo "Password:      123456"
echo "Public Tunnel Details (via ngrok local API):"
curl -s http://127.0.0.1:4040/api/tunnels | grep -o '"public_url":"tcp://[^"]*' || echo "If no URL shown, run: ngrok config add-authtoken YOUR_FREE_NGROK_TOKEN"
echo "=========================================="
