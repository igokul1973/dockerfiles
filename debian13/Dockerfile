# This Dockerfile is a base for all other Dockerfiles needed to spin up Dev Containers
FROM debian:13.1

ENV DEBIAN_FRONTEND=noninteractive

# Update and upgrade without caching
# essential packages, vim, git, git lfs
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    ca-certificates \
    gnupg \
    wget \
    curl \
    llvm \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev \
    lsb-release \
    openssh-client \
    procps \
    vim \
    git \
    git-lfs

# Docker-related packages
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
RUN echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update && apt-get install -y --no-install-recommends docker-ce-cli containerd docker-buildx-plugin docker-compose-plugin && rm -rf /var/lib/apt/lists/*

# Copy .bashrc, .inputrc, .vimrc files, and .vim folders from current host directory to container's user home directory
COPY .bashrc /root/.bashrc
COPY .inputrc /root/.inputrc
COPY .vimrc /root/.vimrc
COPY .vim /root/.vim

RUN chown -R root:root /root/.bashrc && \
    chown -R root:root /root/.inputrc && \
    chown -R root:root /root/.vimrc && \
    chown -R root:root /root/.vim
