FROM debian:bookworm

# Informações do mantenedor
MAINTAINER Thiago Pantoja thiago.pantoja@easynext.online

# Instalar dependências
RUN apt-get update && apt-get install -y \
    postgresql-16 \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Configurar o PostgreSQL
COPY postgresql.conf /etc/postgresql/postgresql.conf
COPY pg_hba.conf /etc/postgresql/pg_hba.conf

# Inicializar o banco de dados e definir permissões
RUN service postgresql start && \
    su - postgres -c "psql -c \"ALTER USER postgres PASSWORD 'postgres';\"" && \
    su - postgres -c "psql -c \"CREATE DATABASE pentaho;\"" && \
    su - postgres -c "psql -c \"CREATE USER pentaho WITH PASSWORD 'password';\"" && \
    su - postgres -c "psql -c \"GRANT ALL PRIVILEGES ON DATABASE pentaho TO pentaho;\""

# Expor portas necessárias
EXPOSE 5432

# Comando para manter o container ativo
CMD ["postgres"]
