#!/bin/bash
set -e

echo "Iniciando o script de inicialização..."

echo "Esperando o PostgreSQL iniciar..."
until psql -U "$POSTGRES_USER" -c '\l'; do
  >&2 echo "PostgreSQL está indisponível - esperando..."
  sleep 5
done

echo "PostgreSQL iniciado, criando banco_a..."
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname postgres <<-EOSQL
    CREATE DATABASE banco_a;
EOSQL
echo "Banco de dados banco_a criado."

echo "Restaurando backup_a.dmp..."
pg_restore -U "$POSTGRES_USER" -d banco_a /docker-entrypoint-initdb.d/backup_a.dmp || {
  echo "Erro ao restaurar backup_a.dmp"
  exit 1
}
echo "Banco de dados banco_a restaurado com sucesso."

echo "Criando banco_b..."
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname postgres <<-EOSQL
    CREATE DATABASE banco_b;
EOSQL
echo "Banco de dados banco_b criado."

echo "Restaurando backup_b.dmp..."
pg_restore -U "$POSTGRES_USER" -d banco_b /docker-entrypoint-initdb.d/backup_b.dmp || {
  echo "Erro ao restaurar backup_b.dmp"
  exit 1
}
echo "Banco de dados banco_b restaurado com sucesso."

echo "Script de inicialização concluído."

