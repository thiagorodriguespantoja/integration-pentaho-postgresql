# Usando uma versão específica da imagem oficial do PostgreSQL
FROM postgres:16.3

# Definindo variáveis de ambiente para o PostgreSQL
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD password

# Copiando os scripts de inicialização e backups para o diretório de entrada do contêiner
COPY init-scripts /docker-entrypoint-initdb.d/
COPY backups/backup_a.dmp /docker-entrypoint-initdb.d/backup_a.dmp
COPY backups/backup_b.dmp /docker-entrypoint-initdb.d/backup_b.dmp
COPY pg_hba.conf /etc/postgresql/pg_hba.conf

# Expondo a porta do PostgreSQL
EXPOSE 5432

# Comando para copiar o pg_hba.conf e iniciar o PostgreSQL
CMD ["bash", "-c", "rm -rf /var/lib/postgresql/data && cp /etc/postgresql/pg_hba.conf /var/lib/postgresql/data/pg_hba.conf && docker-entrypoint.sh postgres"]







