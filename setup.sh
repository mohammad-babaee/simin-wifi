#!/bin/bash

echo ""
echo " ▗▄▄▖▗▄▄▄▖▗▖  ▗▖▗▄▄▄▖▗▖  ▗▖    ▗▖ ▗▖▗▄▄▄▖▗▄▄▄▖▗▄▄▄▖         ▗▄▖ ▗▖ ▗▖▗▄▄▄▖▗▄▖      ▗▄▄▖▗▄▄▄▖▗▄▄▄▖▗▖ ▗▖▗▄▄▖ "
echo "▐▌     █  ▐▛▚▞▜▌  █  ▐▛▚▖▐▌    ▐▌ ▐▌  █  ▐▌     █          ▐▌ ▐▌▐▌ ▐▌  █ ▐▌ ▐▌    ▐▌   ▐▌     █  ▐▌ ▐▌▐▌ ▐▌"
echo " ▝▀▚▖  █  ▐▌  ▐▌  █  ▐▌ ▝▜▌    ▐▌ ▐▌  █  ▐▛▀▀▘  █          ▐▛▀▜▌▐▌ ▐▌  █ ▐▌ ▐▌     ▝▀▚▖▐▛▀▀▘  █  ▐▌ ▐▌▐▛▀▘ "
echo "▗▄▄▞▘▗▄█▄▖▐▌  ▐▌▗▄█▄▖▐▌  ▐▌    ▐▙█▟▌▗▄█▄▖▐▌   ▗▄█▄▖        ▐▌ ▐▌▝▚▄▞▘  █ ▝▚▄▞▘    ▗▄▄▞▘▐▙▄▄▖  █  ▝▚▄▞▘▐▌" 
echo ""
echo "Разработчик : Мохаммад Бабаи | Developer : Mohammad Babaee"
echo ""

echo "🚀 Installing Dependencies for SIMIN AI Assistant... "

echo " --- Installing The Network Manager --- "
sudo apt update && sudo apt install -y network-manager

echo " --- Starting The Network Manager Service ⚒️ --- "
sudo systemctl start NetworkManager.service 

echo " --- Enabling The Network Manager Service 💻 --- "
sudo systemctl enable NetworkManager.service

echo ""
echo "✅ Setup Complete! You can now go and run: ./simin-wifi.rb 💃"
echo " --------------------------- "

# Verify nmcli installation
if nmcli --version &>/dev/null; then
  echo "✅ nmcli is ready to go!"
else
  echo "❌ Installation failed, check dependencies!"
  exit 1
fi
