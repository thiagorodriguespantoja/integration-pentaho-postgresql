FROM debian:bookworm

# Instalar pacotes necessários
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    wget \
    unzip \
    libwebkit2gtk-4.0-37 \
    python3-pip \
    python3-venv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Criar um ambiente virtual
RUN python3 -m venv /opt/venv

# Ativar ambiente virtual e instalar gdown
RUN /opt/venv/bin/pip install gdown

WORKDIR /opt

# Baixar arquivo zip do Pentaho PDI do Google Drive usando gdown
RUN /opt/venv/bin/gdown https://drive.google.com/uc?id=18L6v2045b7UwNwVCpIG20pVG9LH4kLbl -O pdi-ce-9.4.0.0-343.zip && \
    unzip pdi-ce-9.4.0.0-343.zip && \
    rm pdi-ce-9.4.0.0-343.zip

# Definir variáveis de ambiente
ENV PENTAHO_HOME=/opt/data-integration
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

# Expor portas necessárias
EXPOSE 8080

# Comando padrão
CMD ["bash"]















