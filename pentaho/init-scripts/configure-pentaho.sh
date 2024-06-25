#!/bin/bash

# Configuração do Pentaho
echo "Configurando o Pentaho..."

# Verificar se os diretórios existem
if [ ! -d "/usr/lib/jvm/java-17-openjdk-amd64" ]; then
    echo "Diretório JAVA_HOME não encontrado. Certifique-se de que o Java está instalado."
    exit 1
fi

if [ ! -d "/opt/data-integration" ]; then
    echo "Diretório PENTAHO_HOME não encontrado. Certifique-se de que o Pentaho está instalado."
    exit 1
fi

# Definir variáveis de ambiente
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PENTAHO_HOME=/opt/data-integration

# Configurar permissões de execução para os scripts do Pentaho
chmod +x $PENTAHO_HOME/*.sh

# Mensagem de conclusão
echo "Configuração do Pentaho concluída."


