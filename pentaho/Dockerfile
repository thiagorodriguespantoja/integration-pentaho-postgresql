FROM debian:bookworm

# Instalar dependências
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    wget \
    unzip \
    libwebkit2gtk-4.0-37 \
    python3-pip \
    python3-venv \
    nginx \
    supervisor && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Criar e ativar o ambiente virtual do Python
RUN python3 -m venv /opt/venv

# Instalar o gdown no ambiente virtual
RUN /opt/venv/bin/pip install gdown && \
    /opt/venv/bin/pip install --upgrade pip setuptools wheel

# Configurar diretório de trabalho
WORKDIR /opt

# Baixar e descompactar o arquivo do Pentaho PDI
RUN /opt/venv/bin/gdown "https://drive.google.com/uc?export=download&id=18L6v2045b7UwNwVCpIG20pVG9LH4kLbl" -O pdi-ce-9.4.0.0-343.zip && \
    unzip pdi-ce-9.4.0.0-343.zip && \
    rm pdi-ce-9.4.0.0-343.zip

# Copiar configuração do Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Copiar configuração do Supervisor
COPY supervisord.conf /etc/supervisor/supervisord.conf

# Copiar e configurar scripts de inicialização
COPY init-scripts/configure-pentaho.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/configure-pentaho.sh

# Expor portas necessárias
EXPOSE 80 8080

# Iniciar o Supervisor
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
















