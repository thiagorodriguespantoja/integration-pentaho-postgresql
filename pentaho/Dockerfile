FROM debian:bookworm

# Install dependencies
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    wget \
    unzip \
    libwebkit2gtk-4.0-37 \
    python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install gdown
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --upgrade pip
RUN pip install gdown

WORKDIR /opt

# Download and unzip Pentaho
RUN gdown --id 18L6v2045b7UwNwVCpIG20pVG9LH4kLbl -O pdi-ce-9.4.0.0-343.zip && \
    unzip pdi-ce-9.4.0.0-343.zip && \
    rm pdi-ce-9.4.0.0-343.zip

# Copy init scripts
COPY init-scripts/ /docker-entrypoint-initdb.d/

ENTRYPOINT ["/opt/data-integration/kitchen.sh"]












