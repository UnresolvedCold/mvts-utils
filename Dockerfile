FROM eclipse-temurin:21-jdk

ENV DEBIAN_FRONTEND=noninteractive

# Base packages required for brew + development
RUN apt-get update && apt-get install -y \
    build-essential \
    procps \
    curl \
    file \
    git \
    ca-certificates \
    python3 \
    python3-pip \
    python3-venv \
    maven \
    jq \
    unzip \
    zip \
    ripgrep \
    fd-find \
    tree \
    htop \
    vim \
    nano \
    tmux \
    openssh-client \
    && rm -rf /var/lib/apt/lists/*

# Install Node 22
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get install -y nodejs

# Install OpenClaw CLI
RUN npm install -g openclaw@latest

# Create brew user
RUN useradd -m -s /bin/bash linuxbrew

USER linuxbrew

# Install Homebrew
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add brew to PATH
ENV PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:${PATH}"

# Install useful brew tools
RUN brew install \
    gh \
    lazygit \
    bat \
    fd \
    fzf \
    just \
    direnv

USER root

WORKDIR /workspace

EXPOSE 18789

CMD ["/bin/bash"]
