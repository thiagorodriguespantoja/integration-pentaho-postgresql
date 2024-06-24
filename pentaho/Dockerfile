FROM debian:bookworm

# Install necessary packages
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    wget \
    unzip \
    libwebkit2gtk-4.0-37 \
    python3-pip \
    python3-venv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a virtual environment
RUN python3 -m venv /opt/venv

# Activate virtual environment and install gdown
RUN /opt/venv/bin/pip install gdown

WORKDIR /opt

# Download Pentaho PDI zip file from Google Drive using gdown
RUN /opt/venv/bin/gdown https://drive.google.com/uc?id=18L6v2045b7UwNwVCpIG20pVG9LH4kLbl -O pdi-ce-9.4.0.0-343.zip && \
    unzip pdi-ce-9.4.0.0-343.zip && \
    rm pdi-ce-9.4.0.0-343.zip

# Set environment variables
ENV PENTAHO_HOME=/opt/data-integration
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

# Expose necessary ports
EXPOSE 8080

# Default command
CMD ["bash"]














