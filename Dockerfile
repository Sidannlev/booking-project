FROM nginx:latest

# Копируем файлы сайта в директорию Nginx
COPY ./ /usr/share/nginx/html

# Установка необходимых утилит
RUN apt-get update && apt-get install -y curl htop && rm -rf /var/lib/apt/lists/*

# Установка Trivy для сканирования уязвимостей
RUN curl -sfL https://github.com/aquasecurity/trivy/releases/download/v0.29.0/trivy_0.29.0_Linux-64bit.tar.gz | tar -xz -C /usr/local/bin trivy

# Выполняем сканирование образа на уязвимости
RUN trivy image eremark/booking-docker || true

# Определяем команду запуска: сначала мониторинг, потом сервер
CMD ["sh", "-c", "htop & nginx -g 'daemon off;'"]

