FROM debian:bookworm

# Instalar dependências necessárias e limpar cache
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    wget \
    unzip \
    libwebkit2gtk-4.0-37 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Definir diretório de trabalho
WORKDIR /opt

# Baixar e descompactar o Pentaho
RUN wget https://downloads.sourceforge.net/project/pentaho/Pentaho%20Data%20Integration/9.4/pdi-ce-9.4.0.0-343.zip -O pdi-ce-9.4.0.0-343.zip \
    && unzip pdi-ce-9.4.0.0-343.zip \
    && rm pdi-ce-9.4.0.0-343.zip

# Copiar scripts de inicialização
COPY init-scripts/ /docker-entrypoint-initdb.d/

# Definir variáveis de ambiente
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PDI_HOME=/opt/data-integration

# Definir ponto de entrada
ENTRYPOINT ["/docker-entrypoint-initdb.d/configure-pentaho.sh"]

# Expor a porta 8080
EXPOSE 8080









