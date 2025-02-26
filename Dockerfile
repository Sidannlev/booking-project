# Установка необходимых утилит
RUN apt-get update && apt-get install -y curl htop && rm -rf /var/lib/apt/lists/*
