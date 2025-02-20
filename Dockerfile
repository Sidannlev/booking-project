# Базовый образ
FROM debian:12.9

# Установим необходимые пакеты для мониторинга
RUN apt-get update && apt-get install -y \
    procps \
    curl \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Установим команду мониторинга (например, htop для мониторинга процессов)
RUN apt-get install -y htop

# По умолчанию при запуске контейнера будем запускать htop
CMD ["htop"]
