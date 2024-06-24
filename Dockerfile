# Dockerfile

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
COPY postgresql.conf /etc/postgresql/postgresql.conf
COPY adjust-config.sh /docker-entrypoint-initdb.d/adjust-config.sh

# Expondo a porta do PostgreSQL
EXPOSE 5432

# Usando um novo diretório para os dados do PostgreSQL
VOLUME /var/lib/postgresql/data_pg

# Permitir execução do script de ajuste
RUN chmod +x /docker-entrypoint-initdb.d/adjust-config.sh

# Remover o conteúdo do diretório de dados (se existir) e iniciar o PostgreSQL
CMD ["bash", "-c", "rm -rf /var/lib/postgresql/data_pg/* && docker-entrypoint.sh postgres"]






