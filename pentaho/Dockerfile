FROM debian:bookworm

# Informações do mantenedor
MAINTAINER Thiago Pantoja thiago.pantoja@easynext.online
LABEL Pentaho='Server 9.0 com drivers postgres e oracle'

# Definir variáveis de ambiente
ENV BISERVER_VERSION 9.0
ENV BISERVER_TAG 9.0.0.0-423
ENV PENTAHO_HOME /opt/pentaho
ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-amd64

# Instalar dependências
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    unzip \
    zip \
    git \
    vim \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Criar diretório e usuário para o Pentaho
RUN mkdir ${PENTAHO_HOME} && useradd -s /bin/bash -d ${PENTAHO_HOME} pentaho && chown -R pentaho:pentaho ${PENTAHO_HOME}

# Copiar e descompactar o Pentaho BI Server
COPY pentaho-server-ce-${BISERVER_TAG}.zip /tmp/
RUN /usr/bin/unzip -q /tmp/pentaho-server-ce-${BISERVER_TAG}.zip -d ${PENTAHO_HOME} && \
    rm -f /tmp/pentaho-server-ce-${BISERVER_TAG}.zip ${PENTAHO_HOME}/pentaho-server/promptuser.sh && \
    sed -i -e 's/\(exec ".*"\) start/\1 run/' ${PENTAHO_HOME}/pentaho-server/tomcat/bin/startup.sh && \
    chmod +x ${PENTAHO_HOME}/pentaho-server/start-pentaho.sh

# Adicionar drivers de banco de dados (se houver)
# COPY ./lib/. ${PENTAHO_HOME}/pentaho-server/tomcat/lib

# Configurar usuário não-root
USER pentaho

# Definir diretório de trabalho
WORKDIR ${PENTAHO_HOME}

# Expor portas necessárias
EXPOSE 8080 8009

# Comando para iniciar o Pentaho
CMD ["sh", "/opt/pentaho/pentaho-server/start-pentaho.sh"]
