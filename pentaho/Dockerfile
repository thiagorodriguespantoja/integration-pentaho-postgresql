FROM debian:bookworm

# Install necessary packages
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    wget \
    unzip \
    libwebkit2gtk-4.0-37 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /opt

# Download and unzip Pentaho
RUN wget -O pdi-ce-9.4.0.0-343.zip "https://drive.google.com/uc?export=download&id=1NJWRL9cpSdr0sEsuILH1yyvM_DQfKK7J" && \
    unzip pdi-ce-9.4.0.0-343.zip && \
    rm pdi-ce-9.4.0.0-343.zip

# Copy initialization scripts
COPY init-scripts/ /docker-entrypoint-initdb.d/










