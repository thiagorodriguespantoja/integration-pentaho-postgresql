FROM ubuntu:20.04

# Instalar dependências
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    wget \
    unzip \
    libwebkitgtk-3.0-0

# Definir diretório de trabalho
WORKDIR /opt

# Baixar e descompactar o Pentaho
RUN wget https://sourceforge.net/projects/pentaho/files/Pentaho-9.4/client-tools/pdi-ce-9.4.0.0-343.zip \
    && unzip pdi-ce-9.4.0.0-343.zip \
    && rm pdi-ce-9.4.0.0-343.zip

# Copiar scripts de inicialização
COPY init-scripts/ /docker-entrypoint-initdb.d/

# Definir o ponto de entrada
CMD ["/opt/data-integration/spoon.sh"]



