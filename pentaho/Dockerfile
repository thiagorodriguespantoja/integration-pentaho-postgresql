FROM debian:bookworm

# Instala as dependências necessárias
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    wget \
    unzip \
    libwebkit2gtk-4.0-37 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Define o diretório de trabalho
WORKDIR /opt

# Baixa e descompacta o Pentaho usando o link direto do Google Drive
RUN wget -O pdi-ce-9.4.0.0-343.zip "https://drive.google.com/uc?export=download&id=18L6v2045b7UwNwVCpIG20pVG9LH4kLbl" && \
    unzip pdi-ce-9.4.0.0-343.zip && \
    rm pdi-ce-9.4.0.0-343.zip

# Adiciona scripts de inicialização
COPY init-scripts/ /docker-entrypoint-initdb.d/











