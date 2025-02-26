# Установка Trivy
RUN apt-get update && apt-get install -y curl && \
    curl -sfL https://github.com/aquasecurity/trivy/releases/download/v0.22.0/trivy_0.22.0_Linux-64bit.deb -o trivy.deb && \
    dpkg -i trivy.deb && rm trivy.deb
