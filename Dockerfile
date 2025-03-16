FROM ubuntu

RUN apt-get update && apt-get install -y \
    sudo zsh curl wget unzip git vim nano \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

ARG USERNAME
ARG NAME
ARG EMAIL

RUN usermod -aG sudo ubuntu \
    && echo "ubuntu ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ubuntu \
    && chsh -s $(which zsh) ubuntu

USER ubuntu
RUN curl -sS https://starship.rs/install.sh | sudo sh -s -- -y
COPY .zshrc /home/ubuntu/.zshrc && sudo chown ubuntu:ubuntu /home/ubuntu/.zshrc

RUN git config --global user.name "$NAME" \
    && git config --global user.email "$EMAIL" \
    && git config --global init.defaultBranch main

USER root
