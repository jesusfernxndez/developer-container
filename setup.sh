#!/bin/sh
curl -sS https://starship.rs/install.sh | sh -s -- -y

mkdir -p $HOME/.local/share/zinit \
    && git clone https://github.com/zdharma-continuum/zinit.git $HOME/.local/share/zinit/zinit.git