# Usando uma versão específica da imagem oficial do PostgreSQL
FROM postgres:16.3

# Definindo variáveis de ambiente para o PostgreSQL
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD password

# Copiando os arquivos de configuração e scripts de inicialização para o diretório apropriado do contêiner
COPY postgresql.conf /usr/share/postgresql/postgresql.conf
COPY pg_hba.conf /usr/share/postgresql/pg_hba.conf
COPY init-scripts/01-create-and-restore-databases.sh /docker-entrypoint-initdb.d/
COPY init-scripts/adjust-config.sh /docker-entrypoint-initdb.d/
COPY backups/backup_a.dmp /docker-entrypoint-initdb.d/backup_a.dmp
COPY backups/backup_b.dmp /docker-entrypoint-initdb.d/backup_b.dmp

# Expondo a porta do PostgreSQL
EXPOSE 5432

# Usando um novo diretório para os dados do PostgreSQL
VOLUME /var/lib/postgresql/data_pg

# Remover o conteúdo do diretório de dados (se existir) e iniciar o PostgreSQL
CMD ["bash", "-c", "rm -rf /var/lib/postgresql/data_pg/* && docker-entrypoint.sh postgres -c config_file=/usr/share/postgresql/postgresql.conf"]








