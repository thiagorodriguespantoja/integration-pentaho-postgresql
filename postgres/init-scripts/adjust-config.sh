#!/bin/bash
# Script para configurar o PostgreSQL

# Ajusta o arquivo postgresql.conf para permitir conexões externas
echo "listen_addresses='*'" >> /var/lib/postgresql/data/postgresql.conf

# Ajusta o arquivo pg_hba.conf para permitir acesso a partir de qualquer IP
echo "host all all 0.0.0.0/0 md5" >> /var/lib/postgresql/data/pg_hba.conf

# Inicia o PostgreSQL se ele não estiver rodando
pg_ctl -D /var/lib/postgresql/data restart || pg_ctl -D /var/lib/postgresql/data start




