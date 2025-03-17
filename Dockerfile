FROM ubuntu

RUN apt-get update && apt-get install -y \
    sudo zsh curl wget unzip git vim nano \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

ARG USERNAME
ARG NAME
ARG EMAIL

RUN userdel -r ubuntu || true && groupdel ubuntu || true

RUN curl -sS https://starship.rs/install.sh | sudo sh -s -- -y
RUN mkdir -p /root/.local/share/zinit \
    && git clone https://github.com/zdharma-continuum/zinit.git /root/.local/share/zinit/zinit.git

COPY .zshrc /root/.zshrc 

RUN git config --global user.name "$NAME" \
    && git config --global user.email "$EMAIL" \
    && git config --global init.defaultBranch main
