#!/bin/bash
# Script para configurar o PostgreSQL

# Verifica se o script está sendo executado pelo usuário postgres
if [ "$EUID" -ne $(id -u postgres) ]; then
  echo "Por favor, execute este script como o usuário 'postgres'."
  exit 1
fi

# Ajusta o arquivo postgresql.conf para permitir conexões externas
echo "listen_addresses='*'" >> /var/lib/postgresql/data/postgresql.conf

# Ajusta o arquivo pg_hba.conf para permitir acesso a partir de qualquer IP
echo "host all all 0.0.0.0/0 md5" >> /var/lib/postgresql/data/pg_hba.conf

# Inicia o PostgreSQL
pg_ctl -D /var/lib/postgresql/data start


