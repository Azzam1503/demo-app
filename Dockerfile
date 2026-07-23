FROM jenkins/jenkins:lts

USER root

# Install Docker CLI dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    ca-certificates

# Install Docker CLI
RUN curl -fsSL https://get.docker.com | sh

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/v1.36.1/bin/linux/arm64/kubectl" \
    && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl \
    && rm kubectl

# Install Kind
RUN curl -Lo /usr/local/bin/kind \
    https://kind.sigs.k8s.io/dl/v0.30.0/kind-linux-arm64 \
    && chmod +x /usr/local/bin/kind

# Install Helm
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

USER jenkins
