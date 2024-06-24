# Use a imagem base do Ubuntu ou outra de sua preferência
FROM ubuntu:20.04

# Instala as dependências necessárias
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    wget \
    unzip \
    libwebkitgtk-3.0-0

# Define o diretório de trabalho
WORKDIR /opt

# Baixa e descompacta o Pentaho Data Integration (PDI)
RUN wget https://sourceforge.net/projects/pentaho/files/Pentaho-9.4/client-tools/pdi-ce-9.4.0.0-343.zip \
    && unzip pdi-ce-9.4.0.0-343.zip \
    && rm pdi-ce-9.4.0.0-343.zip

# Define variáveis de ambiente
ENV PDI_HOME=/opt/data-integration

# Copia scripts de inicialização (se houver)
COPY init-scripts/ /docker-entrypoint-initdb.d/

# Expondo a porta (se necessário)
EXPOSE 8080

# Comando de inicialização do Pentaho
CMD ["bash", "-c", "$PDI_HOME/spoon.sh"]

