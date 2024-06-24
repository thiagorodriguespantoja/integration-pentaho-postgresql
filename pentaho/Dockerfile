FROM debian:bookworm

# Instala as dependências necessárias
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    wget \
    unzip \
    libwebkit2gtk-4.0-37 \
    python3-pip \
    python3-venv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Define o diretório de trabalho
WORKDIR /opt

# Cria e ativa um ambiente virtual, e instala o gdown nele
RUN python3 -m venv /opt/venv && \
    . /opt/venv/bin/activate && \
    pip install gdown

# Baixa e descompacta o Pentaho usando o link direto do Google Drive
RUN . /opt/venv/bin/activate && \
    gdown --id 18L6v2045b7UwNwVCpIG20pVG9LH4kLbl -O pdi-ce-9.4.0.0-343.zip && \
    unzip pdi-ce-9.4.0.0-343.zip && \
    rm pdi-ce-9.4.0.0-343.zip

# Adiciona scripts de inicialização
COPY init-scripts/ /docker-entrypoint-initdb.d/













