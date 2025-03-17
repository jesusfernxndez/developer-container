FROM ubuntu

RUN apt-get update && apt-get install -y \
    sudo zsh curl wget unzip git vim nano \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

ARG USERNAME
ARG NAME
ARG EMAIL

RUN userdel -r ubuntu || true && groupdel ubuntu || true && chsh -s /usr/bin/zsh

RUN curl -sS https://starship.rs/install.sh | sudo sh -s -- -y
COPY .zshrc /root/.zshrc 

RUN git config --global user.name "$NAME" \
    && git config --global user.email "$EMAIL" \
    && git config --global init.defaultBranch main

USER root

CMD ["zsh"]
