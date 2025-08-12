FROM python:3.11

# Install essential tools
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libegl1 \
    libsm6 \
    libxext6 \
    curl \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Create user (VS Code expects this)
RUN useradd -m vscode
USER vscode


WORKDIR /workspace
