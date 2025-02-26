FROM nginx:latest

# Копируем файлы сайта в директорию Nginx
COPY ./ /usr/share/nginx/html

# Установка необходимых утилит
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Установка Trivy для сканирования уязвимостей
RUN curl -sfL https://github.com/aquasecurity/trivy/releases/latest/download/trivy_Linux-64bit.tar.gz | tar xz -C /usr/local/bin

# Определяем команду запуска: сначала мониторинг, потом сервер
CMD ["sh", "-c", "top & nginx -g 'daemon off;'"]
