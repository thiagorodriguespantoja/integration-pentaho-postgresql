FROM debian:bookworm

# Instalar dependências
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    wget \
    unzip \
    libwebkit2gtk-4.0-37 \
    python3-pip \
    python3-venv \
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

# Copiar o arquivo de configuração do supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expor portas necessárias
EXPOSE 8080 6000

# Manter o container ativo
CMD ["/usr/bin/supervisord"]
















