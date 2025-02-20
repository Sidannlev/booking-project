#!/bin/bash
cd ~/booking-project
git pull origin main
sudo systemctl restart apache2  # Перезапуск веб-сервера (если используешь Apache)
chmod +x ~/update-site.sh
