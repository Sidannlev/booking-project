FROM nginx:latest

# Копируем файлы сайта в директорию Nginx
COPY ./ /usr/share/nginx/html

# Установка необходимых утилит
RUN apt-get update && apt-get install -y curl htop && rm -rf /var/lib/apt/lists/*

# Установка Trivy для сканирования уязвимостей
RUN curl -sfL https://github.com/aquasecurity/trivy/releases/download/v0.39.0/trivy_0.39.0_Linux-64bit.tar.gz | tar xz -C /usr/local/bin

# Выполняем сканирование образа на уязвимости (только на этапе сборки образа)
# Эта команда должна быть выполнена на вашей машине или в CI/CD процессе, а не внутри Dockerfile.
RUN trivy image eremark/booking-docker || true

# Определяем команду запуска: сначала мониторинг, потом сервер
CMD ["sh", "-c", "htop & nginx -g 'daemon off;'"]
