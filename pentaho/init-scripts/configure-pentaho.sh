#!/bin/bash

# Configuração do Pentaho
echo "Configurando o Pentaho..."

# Definir variáveis de ambiente
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PENTAHO_HOME=/opt/data-integration

# Configurar permissões de execução para os scripts do Pentaho
chmod +x $PENTAHO_HOME/*.sh

# Exemplo de configuração adicional, se necessário
# mv /path/to/some/config/file $PENTAHO_HOME/.kettle/

# Mensagem de conclusão
echo "Configuração do Pentaho concluída."


